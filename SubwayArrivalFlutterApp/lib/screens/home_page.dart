import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/arrival_info.dart';
import '../services/subway_service.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArrivalInfo> _arrivals = [];
  String _station = '서울역';
  String _direction = '상행';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _station = prefs.getString('stationName') ?? '서울역';
      _direction = prefs.getString('direction') ?? '상행';
    });
    _fetchArrivals();
  }

  Future<void> _fetchArrivals() async {
    final infos = await SubwayService.fetchArrivalInfo(_station);
    setState(() {
      _arrivals = infos.take(2).toList();
    });
  }

  void _openSettings() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SettingsPage()),
    );
    _loadPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('실시간 도착'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _openSettings,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('$_station $_direction 열차 도착 정보',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _arrivals.length,
              itemBuilder: (_, i) {
                final info = _arrivals[i];
                return ListTile(
                  title: Text(info.trainLineName),
                  subtitle: Text(info.arrivalMessage),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
