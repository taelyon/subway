import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(SubwayArrivalApp());
}

class SubwayArrivalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 도착 정보',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
