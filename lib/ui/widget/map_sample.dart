import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logistix/constants/colors.dart';

import '../../constants/api_keys.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  void initState() {
    // getCurrentLocation();
     getPolyPoints();
    super.initState();
  }

  static const LatLng sourceLocation =
  LatLng(37.42796133580664, -122.085749655962);

  static const LatLng destination =
      LatLng(37.43296265331129, -122.08832357078792);

  List<LatLng> polylineCoordinates = [];



  // LocationData? currentLocation;

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  //LatLng(
  //             currentLocation!.latitude!,
  //             currentLocation!.longitude!),

  //currentLocation == null
  //         ? CircularProgressIndicator()
  //         :

  @override
  Widget build(BuildContext context) {
   return   GoogleMap(
      initialCameraPosition: CameraPosition(
        target: sourceLocation,
        zoom: 14.4746,
      ),
      markers: {

        Marker(
            markerId: MarkerId('source'),
            position: sourceLocation
        ),
        Marker(
            markerId: MarkerId('destination'),
            position: destination
        ),
      },
      polylines: {
        Polyline(
          polylineId: const PolylineId('route'),
          points: polylineCoordinates,
          color: signUpPageBackgroundColor,

        )
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if(result.points.isNotEmpty){
      result.points
          .forEach((PointLatLng point)
      => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude))
      );
      setState(() {});
    }else{
      print(result.errorMessage);
    }
    print(result.points);
  }
  //
  // void getCurrentLocation(){
  //   Location location = Location();
  //
  //   location.getLocation()
  //       .then((location) => currentLocation = location
  //   );
  // }


  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}