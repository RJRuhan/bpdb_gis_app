import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

void main() {
  ArcGISEnvironment.apiKey = 'AAPTxy8BH1VEsoebNVZXo8HurAFE2q-koQZa7Iyb9dXPGSPf8d6OESWOHBF4qKasL6zU7mh_6x_KdCTsKYtRksekrrVTDjvkEHr0q29S1GMu8qOegDm_Mkdxnqm8E5arpB1ZbVaa2zITidhNieM-IsQDsVTuJ7e15CkpBmqULLScGGMJpSgYe_ygigI9edJzxuBfafVjUB06Vp734Ny786BorANkCYHI1o4fQfMSTEBlVuc.AT1_KEl9jRto';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPDB Zone Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AddFeatureLayers(), // <-- Connect AddFeatureLayers here
    );
  }
}




// Create an enumeration to define the feature layer sources.
enum Source { url, portalItem, geodatabase, geopackage, shapefile }

class AddFeatureLayers extends StatefulWidget {
  const AddFeatureLayers({super.key});

  @override
  State<AddFeatureLayers> createState() => _AddFeatureLayersState();
}

class _AddFeatureLayersState extends State<AddFeatureLayers>
    with SampleStateSupport {
  // Create a map with a topographic basemap style.
  final _map = ArcGISMap.withBasemapStyle(BasemapStyle.osmStreets);
  // Create a map view controller.
  final _mapViewController = ArcGISMapView.createController();

  // Create a list of feature layer sources.
  final _featureLayerSources = <DropdownMenuEntry<Source>>[];

  // Create a variable to store the selected feature layer source.
  Source? _selectedFeatureLayerSource;

  @override
  void initState() {
    super.initState();

    // Add feature layer sources to the list.
    _featureLayerSources.addAll(const [
      // Add a dropdown menu item to load a feature service from a uri.
      DropdownMenuEntry(value: Source.url, label: 'URL'),
      // Add a dropdown menu item to load a feature service from a portal item.
      DropdownMenuEntry(value: Source.portalItem, label: 'Portal Item'),
      // Add a dropdown menu item to load a feature service from a geodatabase.
      DropdownMenuEntry(value: Source.geodatabase, label: 'Geodatabase'),
      // Add a dropdown menu item to load a feature service from a geopackage.
      DropdownMenuEntry(value: Source.geopackage, label: 'Geopackage'),
      DropdownMenuEntry(value: Source.shapefile, label: 'Shapefile'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        // Create a column with a map view and a dropdown menu.
        child: Column(
          children: [
            // Add a map view to the widget tree and set a controller.
            Expanded(
              child: Container(
                child: ArcGISMapView(
                  controllerProvider: () => _mapViewController,
                  onMapViewReady: _onMapViewReady,
                ),
              ),
            ),
            // Create a dropdown menu to select a feature layer source.
            DropdownMenu(
              dropdownMenuEntries: _featureLayerSources,
              trailingIcon: const Icon(Icons.arrow_drop_down),
              textAlign: TextAlign.center,
              textStyle: Theme.of(context).textTheme.labelMedium,
              hintText: 'Select a feature layer source',
              width: calculateMenuWidth(
                context,
                'Select a feature layer source',
              ),
              onSelected: (featureLayerSource) {
                setState(() {
                  _selectedFeatureLayerSource = featureLayerSource;
                });
                handleSourceSelection(featureLayerSource!);
              },
              initialSelection: _selectedFeatureLayerSource,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onMapViewReady() async {
    // Set the map on the map view controller.
    print('MapView is ready');

    _mapViewController.arcGISMap = _map;
  }

  // Handles the selection of a feature layer source from the dropdown menu.
  void handleSourceSelection(Source source) {
    switch (source) {
      case Source.url:
        loadFeatureServiceFromUri();
      default:
        // Handle other sources as needed.
        break;
      
    }
  }

  double calculateMenuWidth(BuildContext context, String menuString) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: menuString,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.size.width;

    return textWidth * 1.5;
  }

  void loadFeatureServiceFromUri() {
    // Create a uri to a feature service.
    final uri = Uri.parse(
      'https://www.arcgisbd.com/server/rest/services/bpdb/general/MapServer/15',
    );
    // Create a service feature table with the uri.
    final serviceFeatureTables = ServiceFeatureTable.withUri(uri);
    // Create a feature layer with the service feature table.
    final serviceFeatureLayer = FeatureLayer.withFeatureTable(
      serviceFeatureTables,
    );

    print('Feature layer loaded from URL: $uri');
    print('Feature layer name: ${serviceFeatureLayer}');
    print('Feature layer id: ${serviceFeatureLayer.id}');
    // print('Feature layer type: ${serviceFeatureLayer.point}');

    // Clear the operational layers and add the feature layer to the map.
    _map.operationalLayers.clear();
    _map.operationalLayers.add(serviceFeatureLayer);
    // Set the viewpoint to the feature layer.
    _mapViewController.setViewpoint(
      Viewpoint.withLatLongScale(
        latitude: 23.6850,
        longitude: 90.3563,
        scale: 5000000, // Adjust scale as needed
      ),
    );
  }

}

/// A mixin that overrides `setState` to first check if the widget is mounted.
/// (Calling `setState` on an unmounted widget causes an exception.)
mixin SampleStateSupport<T extends StatefulWidget> on State<T> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  /// Shows an alert dialog with the given [message].
  void showMessageDialog(
    String message, {
    String title = 'Info',
    bool showOK = false,
  }) {
    if (mounted) {
      showAlertDialog(context, message, title: title, showOK: showOK);
    }
  }
}



Future<void> showAlertDialog(
  BuildContext context,
  String message, {
  String title = 'Alert',
  bool showOK = false,
}) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          content: Text(message),
          actions:
              showOK
                  ? [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ]
                  : null,
        ),
  );
}
