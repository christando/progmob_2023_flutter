import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_2023/constants.dart';
import 'package:progmob_2023/main.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Location location = Location();
  LatLng currentLocation = LatLng(0, 0); // Default location

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation =
            LatLng(userLocation.latitude!, userLocation.longitude!);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var markers;
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: currentLocation,
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                
              ),
              // MarkerLayer(
              //   markers: [
              //     Marker(
              //       width: 40,
              //       height: 40,
              //       point: currentLocation,
              //       builder: (context) => Container(
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.blue, // You can customize the color
              //         ),
              //         child: Icon(
              //           Icons.location_on,
              //           color: Colors.white,
              //           size: 30,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle getDefaultTextStyle() {
  return const TextStyle(
    fontSize: 12,
    backgroundColor: Colors.black,
    color: Colors.white,
  );
}
