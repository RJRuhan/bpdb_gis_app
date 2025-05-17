import 'dart:convert';
import '../constants/constant.dart';
import '../models/regions/zone.dart';
import '../models/regions/circle.dart';
import '../models/regions/snd_info.dart';
import '../models/regions/esu_info.dart';
import '../models/regions/substation.dart';

import 'package:http/http.dart' as http;

import '../models/region_delails_lookup/circle.dart';
import '../models/region_delails_lookup/snd.dart';
import '../models/region_delails_lookup/substation.dart';

class MapApi {
  static Future<List<Zone>> fetchZoneInfo() async {
    final response = await http.get(Uri.parse('$myAPILink/zoneInfoes'));
 
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Zone.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load zones');
    }
  }

  static Future<List<Circles>> fetchCircleInfo(String zoneId) async {
    final response = await http.get(Uri.parse('$myAPILink/CircleInfoes/search?zoneId=$zoneId'));
 
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Circles.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load circles');
    }
  }

  static Future<List<SndInfo>> fetchSnDInfo(String circleId) async {
    final response = await http.get(Uri.parse('$myAPILink/SndInfoes/search?circleId=$circleId'));
 
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => SndInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load SND info');
    }
  }

  static Future<List<EsuInfo>> fetchEsuInfo(String sndId) async {
    final response = await http.get(Uri.parse('$myAPILink/EsuInfoes/search?sndId=$sndId'));
 
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => EsuInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ESU info');
    }
  }

  static Future<List<Substation>> fetchSubstationInfo(String sndId) async {
    final response = await http.get(Uri.parse('$myAPILink/Substations/search?sndId=$sndId'));
 
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Substation.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load substations');
    }
  }

  static Future<void> fetchZoneDetailsInfo(int zoneId) async {
    final response =
        await http.get(Uri.parse('$myAPILink/api/ZoneInfoes/$zoneId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final zone = Zone.fromJson(data);
      GlobalVariables.centerLatitude = zone.centerLatitude;
      GlobalVariables.centerLongitude = zone.centerLongitude;
      GlobalVariables.defaultZoomLevel = zone.defaultZoomLevel.toDouble();
    } else {
      throw Exception('Failed to load Zone info');
    }
  }

  static Future<void> fetchCircleDetailsInfo(int circleId) async {
    final response =
        await http.get(Uri.parse('$myAPILink/api/CircleInfoes/$circleId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final circle = Circle.fromJson(data);
      GlobalVariables.centerLatitude = circle.centerLatitude;
      GlobalVariables.centerLongitude = circle.centerLongitude;
      GlobalVariables.defaultZoomLevel = circle.defaultZoomLevel?.toDouble();
    } else {
      throw Exception('Failed to load Zone info');
    }
  }

  static Future<void> fetchSndDetailsInfo(int sndId) async {
    final response =
        await http.get(Uri.parse('$myAPILink/api/SndInfoes/$sndId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final snd = Snd.fromJson(data);
      GlobalVariables.centerLatitude = snd.centerLatitude;
      GlobalVariables.centerLongitude = snd.centerLongitude;
      GlobalVariables.defaultZoomLevel = snd.defaultZoomLevel?.toDouble();
    } else {
      throw Exception('Failed to load Zone info');
    }
  }

  static Future<void> fetchSubstationDetailsInfo(int substationId) async {
    final response =
        await http.get(Uri.parse('$myAPILink/api/Substations/$substationId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final circle = Substations.fromJson(data);
      GlobalVariables.centerLatitude = circle.latitude;
      GlobalVariables.centerLongitude = circle.longitude;
      GlobalVariables.defaultZoomLevel = circle.defaultZoomLevel?.toDouble();
    } else {
      throw Exception('Failed to load Zone info');
    }
  }

}