import 'package:flutter/material.dart';
import 'package:google_map_live_tracker/qqqqqqqqqqqqqq.dart';
import 'package:google_map_live_tracker/sample.dart';

import 'Locatonmarkers.dart';
import 'mediam_Google_Map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:const LocationMarkers(),
      // home:const MapSample(),
      home: const OrderTrackingPage() ,
      // home:  MapsRoutesExample(title: '112') ,
    );
  }
}
