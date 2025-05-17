import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';

import '../../api/api.dart';
import '../../models/regions/zone.dart';
import '../../models/regions/circle.dart';
import '../../models/regions/snd_info.dart';
import '../../models/regions/esu_info.dart';
import '../../models/regions/substation.dart';

class FilterPanel extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilterChanged;
  final ArcGISMapViewController mapController;
  final Map<String, int?> initialFilters;

  const FilterPanel({
    super.key,
    required this.onFilterChanged,
    required this.mapController,
    required this.initialFilters,
  });

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  bool isPanelVisible = false;
  
  // Filter selections
  int? selectedZoneId;
  int? selectedCircleId;
  int? selectedSndId;
  int? selectedESUId;
  int? selectedSubstationId;
  
  // Data for dropdowns
  List<Zone> zones = [];
  List<Circles> circles = [];
  List<SndInfo> snds = [];
  List<EsuInfo> esus = [];
  List<Substation> substations = [];
  
  // Loading states for dropdowns
  bool isLoadingZones = false;
  bool isLoadingCircles = false;
  bool isLoadingSnds = false;
  bool isLoadingEsus = false;
  bool isLoadingSubstations = false;

  bool showESUField = true;


  @override
  void initState() {
    super.initState();
    
    // Initialize filters from parent widget
    selectedZoneId = widget.initialFilters['zoneId'];
    selectedCircleId = widget.initialFilters['circleId'];
    selectedSndId = widget.initialFilters['sndId'];
    selectedESUId = widget.initialFilters['esuId'];
    selectedSubstationId = widget.initialFilters['substationId'];
    
    // Load initial data
    loadZones();
    
    // Load child data if parent is selected
    if (selectedZoneId != null) {
      loadCircles(selectedZoneId!);
    }
    if (selectedCircleId != null) {
      loadSnds(selectedCircleId!);
    }
    if (selectedSndId != null) {
      loadESUs(selectedSndId!);
      loadSubstations(selectedSndId!);
    }
  }

  Future<void> loadZones() async {
    setState(() {
      isLoadingZones = true;
    });
    
    try {
      final response = await MapApi.fetchZoneInfo();
      setState(() {
        zones = response;
        isLoadingZones = false;
      });
    } catch (e) {
      setState(() {
        isLoadingZones = false;
      });
    }
  }

  Future<void> loadCircles(int zoneId) async {
    setState(() {
      isLoadingCircles = true;
    });
    
    try {
      final response = await MapApi.fetchCircleInfo(zoneId.toString());
      setState(() {
        circles = response;
        isLoadingCircles = false;
      });
    } catch (e) {
      setState(() {
        isLoadingCircles = false;
      });
    }
  }

  Future<void> loadSnds(int circleId) async {
    setState(() {
      isLoadingSnds = true;
    });

    try {
      final response = await MapApi.fetchSnDInfo(
        circleId.toString(),
      );
      setState(() {
        snds = response;
        isLoadingSnds = false;
      });
    } catch (e) {
      setState(() {
        isLoadingSnds = false;
      });
    }
  }

   Future<void> loadESUs(int sndId) async {
    setState(() {
      isLoadingEsus = true;
    });

    try {
      final response = await MapApi.fetchEsuInfo(
        sndId.toString(),
      );
      setState(() {
        esus = response;
        isLoadingEsus = false;
        showESUField = response.isNotEmpty; // Only show if there are ESUs
      });
    } catch (e) {
      setState(() {
        isLoadingEsus = false;
        showESUField = false;
      });
    }
  }

  Future<void> loadSubstations(int sndId) async {
    setState(() {
      isLoadingSubstations = true;
    });

    try {
      final response = await MapApi.fetchSubstationInfo(
        sndId.toString(),
      );
      setState(() {
        substations = response;
        isLoadingSubstations = false;
      });
    } catch (e) {
      setState(() {
        isLoadingSubstations = false;
      });
    }
  }

  void handleZoneChange(int? value) {
    if (value != null && value != selectedZoneId) {
      setState(() {
        selectedZoneId = value;
        selectedCircleId = null;
        selectedSndId = null;
        selectedESUId = null;
        selectedSubstationId = null;
        
        // Clear dependent dropdowns
        circles = [];
        snds = [];
        esus = [];
        substations = [];
        
        // Reset ESU field visibility
        showESUField = true;
      });
      
      // Load circles for the selected zone
      loadCircles(value);
      
      // Notify parent about filter change
      updateFilters();
    
    }
  }

  void handleCircleChange(int? value) {
    if (value != null && value != selectedCircleId) {
      setState(() {
        selectedCircleId = value;
        selectedSndId = null;
        selectedESUId = null;
        selectedSubstationId = null;
        
        // Clear dependent dropdowns
        snds = [];
        esus = [];
        substations = [];
        
        // Reset ESU field visibility
        showESUField = true;
      });
      
      // Load Snds for the selected circle
      loadSnds(value);
      
      // Notify parent about filter change
      updateFilters();
      
    }
  }

  void handleSndChange(int? value) {
    if (value != null && value != selectedSndId) {
      setState(() {
        selectedSndId = value;
        selectedESUId = null;
        selectedSubstationId = null;
        
        // Clear dependent dropdowns
        esus = [];
        substations = [];
        
        // Reset ESU field visibility
        showESUField = true;
      });
      
      // Load ESUs and substations for the selected S&D
      loadESUs(value);
      loadSubstations(value);
      
      // Notify parent about filter change
      updateFilters();
      
    }
  }

  void handleESUChange(int? value) {
    if (value != null && value != selectedESUId) {
      setState(() {
        selectedESUId = value;
        selectedSubstationId = null;
      });
      
      // Notify parent about filter change
      updateFilters();
      
    }
  }

  void handleSubstationChange(int? value) {
    if (value != null && value != selectedSubstationId) {
      setState(() {
        selectedSubstationId = value;
      });
      
      // Notify parent about filter change
      updateFilters();
      
    }
  }

  void resetFilters() {
    setState(() {
      selectedZoneId = null;
      selectedCircleId = null;
      selectedSndId = null;
      selectedESUId = null;
      selectedSubstationId = null;
      
      // Clear all dropdowns
      circles = [];
      snds = [];
      esus = [];
      substations = [];

      // Reset ESU field visibility
      showESUField = true;
    });
    
    // Notify parent about filter reset
    updateFilters();
    
  }

  void updateFilters() {
    // Create filter map to pass to parent
    final filters = {
      'zoneId': selectedZoneId,
      'circleId': selectedCircleId,
      'sndId': selectedSndId,
      'esuId': selectedESUId,
      'substationId': selectedSubstationId,
    };
    
    // Send updated filters to parent
    widget.onFilterChanged(filters);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isPanelVisible ? 300 : 50,
        decoration: BoxDecoration(
          color: Colors.black87,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: isPanelVisible ? _buildFilterPanel() : _buildCollapsedPanel(),
      ),
    );
  }

  Widget _buildCollapsedPanel() {
    return InkWell(
      onTap: () {
        setState(() {
          isPanelVisible = true;
        });
      },
      child: Container(
        color: Colors.black87,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.filter_list, color: Colors.white),
              SizedBox(height: 8),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Filter Map',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterPanel() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter Map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        isPanelVisible = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Reset filters button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: resetFilters,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset Filters'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Zone Filter
                      _buildFilterLabel('Zone'),
                      isLoadingZones
                        ? _buildLoadingIndicator()
                        : _buildDropdown<int>(
                            value: selectedZoneId,
                            items: zones.map((zone) {
                              return DropdownMenuItem<int>(
                                value: zone.zoneId,
                                child: Text(zone.zoneName),
                              );
                            }).toList(),
                            hint: '-- Select Zone --',
                            onChanged: handleZoneChange,
                          ),
                      const SizedBox(height: 16),
                      
                      // Circle Filter
                      _buildFilterLabel('Circle'),
                      isLoadingCircles
                        ? _buildLoadingIndicator()
                        : _buildDropdown<int>(
                            value: selectedCircleId,
                            items: circles.map<DropdownMenuItem<int>>((circle) {
                              return DropdownMenuItem<int>(
                                value: circle.circleId,
                                child: Text(circle.circleName),
                              );
                            }).toList(),
                            hint: '-- Select Circle --',
                            onChanged: selectedZoneId == null ? null : handleCircleChange,
                          ),
                      const SizedBox(height: 16),
                      
                      // S&D Filter
                      _buildFilterLabel('S&D'),
                      isLoadingSnds
                        ? _buildLoadingIndicator()
                        : _buildDropdown<int>(
                            value: selectedSndId,
                            items: snds.map((snd) {
                              return DropdownMenuItem<int>(
                                value: snd.sndId,
                                child: Text(snd.sndName),
                              );
                            }).toList(),
                            hint: '-- Select S&D --',
                            onChanged: selectedCircleId == null ? null : handleSndChange,
                          ),
                      const SizedBox(height: 16),
                      
                        // ESU Filter
                        if (showESUField) ...[
                        _buildFilterLabel('ESU'),
                        isLoadingEsus
                          ? _buildLoadingIndicator()
                          : _buildDropdown<int>(
                            value: selectedESUId,
                            items: esus.map((esu) {
                            return DropdownMenuItem<int>(
                              value: esu.esuId,
                              child: Text(esu.esuName),
                            );
                            }).toList(),
                            hint: '-- Select ESU --',
                            onChanged: selectedSndId == null ? null : handleESUChange,
                          ),
                        const SizedBox(height: 16),
                        ],
                      
                      // Substation Filter
                      _buildFilterLabel('Sub-Station'),
                      isLoadingSubstations
                        ? _buildLoadingIndicator()
                        : _buildDropdown<int>(
                            value: selectedSubstationId,
                            items: substations.map((substation) {
                              return DropdownMenuItem<int>(
                                value: substation.substationId,
                                child: Text(substation.substationName),
                              );
                            }).toList(),
                            hint: '-- Select Substation --',
                            onChanged: selectedSndId == null ? null : handleSubstationChange,
                          ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildLoadingIndicator() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required String hint,
    required Function(T?)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.black,
          border: InputBorder.none,
        ),
        dropdownColor: Colors.black87,
        style: const TextStyle(color: Colors.white),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        isExpanded: true,
      ),
    );
  }
}