import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMarkers extends StatefulWidget {
  const LocationMarkers({Key? key}) : super(key: key);

  @override
  State<LocationMarkers> createState() => _LocationMarkersState();
}

class _LocationMarkersState extends State<LocationMarkers> {
  // on below line we are initializing our controller for google maps.
  final Completer<GoogleMapController> _controller = Completer();

  // on below line we are specifying our camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(11.072035, 76.074005),
    zoom: 5.4746,
  );

  // on below line we have created list of markers


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0F9D58),
          title: Text("GFG"),
        ),
        body: Container(
          // on below line creating google maps.
          child: GoogleMap(
            markers: {
              const Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(20.42796133580664, 80.885749655962),
                  draggable: true,
                  infoWindow: InfoWindow(
                    title: 'My Position',
                  )
              ),

              const Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(10.9840545, 76.1397296),
                  draggable: true,
                  infoWindow: InfoWindow(
                    title: 'Location 1',
                  )
              ),

              const Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(11.3404576,76.28056),
                  draggable: true,
                  infoWindow: InfoWindow(
                    title: 'Location 1',
                  )
              ),

            },
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,


            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        )
    );
  }
}