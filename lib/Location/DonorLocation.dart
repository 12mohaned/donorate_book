import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DonorLocation extends StatefulWidget {
  @override
  _Location createState() => _Location();
}

class _Location extends State<DonorLocation> {
  Position _currentPosition;
  String _currentAddress;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Donation Location'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
