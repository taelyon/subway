import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/arrival_info.dart';
import 'api_key.dart';

class SubwayService {

  static Future<List<ArrivalInfo>> fetchArrivalInfo(
    String station, {
    int startIndex = 0,
    int endIndex = 5,
    String type = 'json',
    String service = 'realtimeStationArrival',
  }) async {
    try {
      final encoded = Uri.encodeComponent(station);
      final url = Uri.parse(
          'https://swopenAPI.seoul.go.kr/api/subway/$subwayApiKey/$type/$service/$startIndex/$endIndex/$encoded');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List list = json['realtimeArrivalList'] as List;
        return list.map((e) => ArrivalInfo.fromJson(e)).toList();
      } else {
        throw Exception('HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching arrival info: $e');
      return [];
    }
  }
}
