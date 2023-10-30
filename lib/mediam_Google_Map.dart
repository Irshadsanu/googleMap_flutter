import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:location/location.dart';



class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);
  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}
class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(10.976944, 76.219577);
  static const LatLng destination = LatLng(11.055274, 76.081712);
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = 'AIzaSyCwSgwOyPl8bpYQspxDxOZuSloOdw8iimg';




  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    print("qqqqqqqq");
    print(sourceLocation.latitude.toString()+"123456");

    PolylineResult result = await polylinePoints.
    getRouteBetweenCoordinates(
      "AIzaSyCfSPzeA-elv13wNzIUqjAYXk0HMOiHSIY", // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.walking,
    );
    print(result.points.toString()+"456");
    if (result.points.isNotEmpty) {
      print("rrrrr");
      for (var point in result.points) {
        polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          );
      }
      setState(() {});
    }
  }

  List<LatLng> points = [
    LatLng(10.976944, 76.219577),
    LatLng(11.055274,  76.081712),
  ];


  MapsRoutes route =  MapsRoutes();
Future<void> getpolyRoutes() async {
  print("IRSHAD");
  await route.drawRoute(points, "Test routes", Colors.purple, googleApiKey);
  print("${route.routes}___IRSHAD");
}

  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
          (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@");
    print(result.toString()+"IRSHAD");
    // TODO: implement initState
    getPolyPoints();
    getCurrentLocation();
    getpolyRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sourceLocation,
          zoom: 13.5,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
        // polylines: {
        //   Polyline(
        //     polylineId: const PolylineId("route"),
        //     points: polylineCoordinates,
        //     color: const Color(0xFF7B61FF),
        //     width: 6,
        //   ),
        // },
        // polylines: route.routes,
      ),
    );
  }
}