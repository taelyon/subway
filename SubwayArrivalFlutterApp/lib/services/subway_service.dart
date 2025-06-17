import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/arrival_info.dart';

class SubwayService {
  // 서울시 열린데이터 광장에서 발급받은 API 키
  static const String _apiKey = '596c69597774616536325742684e64';

  static Future<List<ArrivalInfo>> fetchArrivalInfo(String station) async {
    final encoded = Uri.encodeComponent(station);
    final url = Uri.parse(
        'https://swopenAPI.seoul.go.kr/api/subway/$_apiKey/json/realtimeStationArrival/0/2/$encoded');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List list = json['realtimeArrivalList'] as List;
      return list.map((e) => ArrivalInfo.fromJson(e)).toList();
    }
    return [];
  }
}
