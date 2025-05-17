import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:arcgis_mapview/views/map/map.dart';

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
      home: const BPDBMapView(),
    );
  }
}

