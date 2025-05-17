import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:arcgis_mapview/views/map/filter_map.dart';
import '../../api/api.dart';

import '../../constants/constant.dart';

import '../../models/region_delails_lookup/circle.dart';
import '../../models/region_delails_lookup/snd.dart';
import '../../models/region_delails_lookup/substation.dart';

class BPDBMapView extends StatefulWidget {
  const BPDBMapView({super.key});

  @override
  State<BPDBMapView> createState() => _BPDBMapViewState();
}

class _BPDBMapViewState extends State<BPDBMapView> {
  // Create a map with a topographic basemap style.
  final _map = ArcGISMap.withBasemapStyle(BasemapStyle.osmStreets);
  // Create a map view controller.
  final _mapViewController = ArcGISMapView.createController();

  // Current filters
  Map<String, int?> _currentFilters = {
    'zoneId': null,
    'circleId': null,
    'sndId': null,
    'esuId': null,
    'substationId': null,
  };

  // Base URL for feature services
  final String _baseUrl = 'https://www.arcgisbd.com/server/rest/services/bpdb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BPDB Zone Map'),
      ),
      body: Stack(
        children: [
          ArcGISMapView(
            controllerProvider: () => _mapViewController,
            onMapViewReady: _onMapViewReady,
          ),
          FilterPanel(
            onFilterChanged: _handleFilterChanged,
            mapController: _mapViewController,
            initialFilters: _currentFilters,
          ),
        ],
      ),
    );
  }

  Future<void> _onMapViewReady() async {
    // Set the map on the map view controller.
    print('MapView is ready');
    _mapViewController.arcGISMap = _map;
    
    // Load the feature layer immediately
    loadBaseMap();
  }

  void loadBaseMap() {
    // Clear existing layers
    _map.operationalLayers.clear();

    // Load base map
    final baseMapBDURI = Uri.parse(
      '$_baseUrl/basemaps/MapServer',
    );

    final mapImageLayer = ArcGISMapImageLayer.withUri(baseMapBDURI);
    _map.operationalLayers.add(mapImageLayer);

    // Set initial viewpoint to Bangladesh
    _mapViewController.setViewpoint(
      Viewpoint.withLatLongScale(
        latitude: defaultViewPoint.latitude,
        longitude: defaultViewPoint.longitude,
        scale: defaultViewPoint.scale,
      ),
    );
  }

  Future<void> _handleFilterChanged(Map<String, dynamic> filters) async {
    // Update current filters
    setState(() {
      _currentFilters = Map<String, int?>.from(filters);
    });

    // Clear existing layers except base map
    if (_map.operationalLayers.isNotEmpty) {
      final baseLayer = _map.operationalLayers.first;
      _map.operationalLayers.clear();
      _map.operationalLayers.add(baseLayer);
    } else {
      loadBaseMap();
      return;
    }

    // Check which level is selected and load appropriate layer
    if (filters['substationId'] != null) {
      await _loadAndCenterSubstation(filters['substationId']!);
    } else if (filters['esuId'] != null) {
      await _loadAndCenterESU(filters['esuId']!);
    } else if (filters['sndId'] != null) {
      await _loadAndCenterSND(filters['sndId']!);
    } else if (filters['circleId'] != null) {
      await _loadAndCenterCircle(filters['circleId']!);
    } else if (filters['zoneId'] != null) {
      await _loadAndCenterZone(filters['zoneId']!);
    } else {
      // If all filters are null, reset to Bangladesh view
      loadBaseMap();
    }
  }

  Future<void> _loadAndCenterZone(int zoneId) async {
    try {
      // First fetch zone details information
      await MapApi.fetchZoneDetailsInfo(zoneId);

      print('Zone details fetched: ${GlobalVariables.centerLatitude}, ${GlobalVariables.centerLongitude}, ${GlobalVariables.defaultZoomLevel}');
      
      // Create the feature layer URL with a query parameter for the zoneId
      final zoneLayerUrl = Uri.parse(
        '$_baseUrl/general/MapServer/15'
      );
      
      // Create the service feature table with the URI
      final zoneFeatureTable = ServiceFeatureTable.withUri(zoneLayerUrl);

      print('Feature table created: $zoneFeatureTable');
      
      // Create a query parameters object to filter by zoneId
      final queryParameters = QueryParameters();
      queryParameters.whereClause = "zone_id = $zoneId";
      
      // Create a feature layer with the service feature table
      final zoneFeatureLayer = FeatureLayer.withFeatureTable(zoneFeatureTable);

      print('Feature layer created: $zoneFeatureLayer');
      
      // Set the feature layer's definitionExpression to filter by zoneId
      zoneFeatureLayer.definitionExpression = "zone_id = $zoneId";
      
      // Add the feature layer to the map
      _map.operationalLayers.add(zoneFeatureLayer);

      // Get center coordinates from GlobalVariables that were set in fetchZoneDetailsInfo
      _mapViewController.setViewpoint(
        Viewpoint.withLatLongScale(
          latitude: GlobalVariables.centerLatitude ?? defaultViewPoint.latitude,
          longitude: GlobalVariables.centerLongitude ?? defaultViewPoint.longitude,
          scale: GlobalVariables.defaultZoomLevel ?? defaultViewPoint.scale,
        ),
      );
      
      // Print debug info about the zoom level
      print('Zone ${zoneId} centered at: ${GlobalVariables.centerLatitude}, ${GlobalVariables.centerLongitude}');
      print('Zoom level: ${GlobalVariables.defaultZoomLevel}');
    } catch (e) {
      print('Error loading zone: $e');
      // You could add a toast message here similar to your example
    }
  }

  Future<void> _loadAndCenterCircle(int circleId) async {
    try {
      // Get circle info for coordinates and name
      final circles = await MapApi.fetchCircleInfo(
        _currentFilters['zoneId'].toString(),
      );
      final selectedCircle = circles.firstWhere((circle) => circle.circleId == circleId);
      
      // Create URL for circle layer
      final circleLayerUrl = Uri.parse(
        '$_baseUrl/circles/${selectedCircle.circleName.toLowerCase().replaceAll(' ', '_')}/MapServer/0'
      );
      
      // Create and add the feature layer
      final circleFeatureTable = ServiceFeatureTable.withUri(circleLayerUrl);
      final circleFeatureLayer = FeatureLayer.withFeatureTable(circleFeatureTable);
      _map.operationalLayers.add(circleFeatureLayer);

      
    } catch (e) {
      print('Error loading circle: $e');
    }
  }

  Future<void> _loadAndCenterSND(int sndId) async {
    try {
      // Get SND info for coordinates and name
      final snds = await MapApi.fetchSnDInfo(
        _currentFilters['circleId'].toString(),
      );
      final selectedSND = snds.firstWhere((snd) => snd.sndId == sndId);
      
      // Create URL for SND layer
      final sndLayerUrl = Uri.parse(
        '$_baseUrl/snd/${selectedSND.sndName.toLowerCase().replaceAll(' ', '_')}/MapServer/0'
      );
      
      // Create and add the feature layer
      final sndFeatureTable = ServiceFeatureTable.withUri(sndLayerUrl);
      final sndFeatureLayer = FeatureLayer.withFeatureTable(sndFeatureTable);
      _map.operationalLayers.add(sndFeatureLayer);

      
    } catch (e) {
      print('Error loading SND: $e');
    }
  }

  Future<void> _loadAndCenterESU(int esuId) async {
    try {
      // Get ESU info for coordinates and name
      final esus = await MapApi.fetchEsuInfo(
        _currentFilters['sndId'].toString(),
      );
      
      // Check if ESUs exist (handle case where some SNDs don't have ESUs)
      if (esus.isEmpty) {
        // Fallback to SND level if no ESUs
        await _loadAndCenterSND(_currentFilters['sndId']!);
        return;
      }
      
      final selectedESU = esus.firstWhere((esu) => esu.esuId == esuId);
      
      // Create URL for ESU layer
      final esuLayerUrl = Uri.parse(
        '$_baseUrl/esu/${selectedESU.esuName.toLowerCase().replaceAll(' ', '_')}/MapServer/0'
      );
      
      // Create and add the feature layer
      final esuFeatureTable = ServiceFeatureTable.withUri(esuLayerUrl);
      final esuFeatureLayer = FeatureLayer.withFeatureTable(esuFeatureTable);
      _map.operationalLayers.add(esuFeatureLayer);

      
    } catch (e) {
      print('Error loading ESU: $e');
    }
  }

  Future<void> _loadAndCenterSubstation(int substationId) async {
    try {
      // Get Substation info for coordinates and name
      final substations = await MapApi.fetchSubstationInfo(
        _currentFilters['sndId'].toString(),
      );
      final selectedSubstation = substations.firstWhere((substation) => substation.substationId == substationId);
      
      // Create URL for Substation layer
      final substationLayerUrl = Uri.parse(
        '$_baseUrl/substations/${selectedSubstation.substationName.toLowerCase().replaceAll(' ', '_')}/MapServer/0'
      );
      
      // Create and add the feature layer
      final substationFeatureTable = ServiceFeatureTable.withUri(substationLayerUrl);
      final substationFeatureLayer = FeatureLayer.withFeatureTable(substationFeatureTable);
      _map.operationalLayers.add(substationFeatureLayer);

      
    } catch (e) {
      print('Error loading Substation: $e');
    }
  }
}