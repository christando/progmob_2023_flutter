import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MapScreen> {
  LocationData? currentLocation;
  Location location = Location();

  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  // Dataset
  final String data1 =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  final String data2 =
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
      "when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  final String data3 =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, "
      "totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo";
  final String data4 =
      "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, "
      "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.";
  late String dataSlide;
  late double long;
  late double lat;
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();

    // inisialisasi
    _getLocation();
    _followOnLocationUpdate = FollowOnLocationUpdate.once;
    _followCurrentLocationStreamController = StreamController<double?>();

    //  init slidingup data
    dataSlide = data1;

    //  inisialisasi marker
    allMarkers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: const LatLng(-7.772883015693774, 110.35162041008356),
        // Example location 1
        child: IconButton(
          onPressed: () {
            setState(() {
              dataSlide = data1;
              lat = -7.772883015693774;
              long = 110.35162041008356;
            });
          },
          icon: const Icon(Icons.pin_drop, color: Colors.red),
        ), // Customize the marker
      ),
    );

    allMarkers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: const LatLng(-7.776925950151403, 110.417587608133),
        // Example location 1
        child: IconButton(
          onPressed: () {
            setState(() {
              dataSlide = data2;
              lat = -7.776925950151403;
              long = 110.417587608133;
            });
          },
          icon: const Icon(Icons.pin_drop, color: Colors.red),
        ), // Customize the marker
      ),
    );

    allMarkers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: const LatLng(-7.810447112334517, 110.3317282395377),
        // Example location 1
        child: IconButton(
          onPressed: () {
            setState(() {
              dataSlide = data3;
              lat = -7.810447112334517;
              long = 110.3317282395377;
            });
          },
          icon: const Icon(Icons.pin_drop, color: Colors.red),
        ), // Customize the marker
      ),
    );

    allMarkers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: const LatLng(-7.814152804539516, 110.39514515931207),
        // Example location 1
        child: IconButton(
          onPressed: () {
            setState(() {
              dataSlide = data4;
              lat = -7.814152804539516;
              long = 110.39514515931207;
            });
          },
          icon: const Icon(Icons.pin_drop, color: Colors.red),
        ), // Customize the marker
      ),
    );
  }

  Future<void> _getLocation() async {
    try {
      currentLocation = await location.getLocation();
      print('Latitude: ${currentLocation?.latitude}, Longitude: ${currentLocation?.longitude}');
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print('Error getting location: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                currentLocation?.latitude ?? -2.5489, // Use your preferred default latitude
                currentLocation?.longitude ?? 118.0149, // Use your preferred default longitude
              ),
              initialZoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              CurrentLocationLayer(
                followOnLocationUpdate: _followOnLocationUpdate,
              ),
              MarkerLayer(markers: allMarkers)
            ],
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            panel: Column(
              children: [
                Text(dataSlide),
                ElevatedButton(
                  onPressed: () {
                    MapsLauncher.launchCoordinates(lat, long);
                  },
                  child: Text("Navigasi"),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                setState(
                      () => _followOnLocationUpdate = FollowOnLocationUpdate.once,
                );
              },
              child: const Icon(
                Icons.my_location,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}