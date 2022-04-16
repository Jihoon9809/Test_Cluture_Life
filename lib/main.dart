import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('GoogleMap'),
      ),
      body: MapSample(),
    ),
  ),
  );
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.1429667, 129.03409),
    zoom: 14.4746,
  );


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.1429667, 129.03409),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  List<Marker> _marker = [];
  final List<Marker> _list = const[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(35.1429667, 129.03409),
        infoWindow: InfoWindow(
          title: 'first position'
        )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(35.1429667, 129.04409),
        infoWindow: InfoWindow(
            title: 'sceond position'
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(35.1429667, 129.02409),
        infoWindow: InfoWindow(
            title: 'third position'
        )
    ),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(35.1329667, 129.03409),
        infoWindow: InfoWindow(
            title: 'fourth position'
        )
    ),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(35.1529667, 129.03409),
        infoWindow: InfoWindow(
            title: 'fifth position'
        )
    )
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
// 구글지도 마커찍기
