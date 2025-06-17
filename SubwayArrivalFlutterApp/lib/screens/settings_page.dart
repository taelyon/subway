import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _stationController = TextEditingController();
  String _direction = '상행';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _stationController.text = prefs.getString('stationName') ?? '서울역';
      _direction = prefs.getString('direction') ?? '상행';
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stationName', _stationController.text);
    await prefs.setString('direction', _direction);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('설정')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _stationController,
              decoration: InputDecoration(labelText: '지하철역'),
            ),
            DropdownButton<String>(
              value: _direction,
              items: [
                DropdownMenuItem(value: '상행', child: Text('상행')),
                DropdownMenuItem(value: '하행', child: Text('하행')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _direction = value;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: Text('저장'),
            )
          ],
        ),
      ),
    );
  }
}
