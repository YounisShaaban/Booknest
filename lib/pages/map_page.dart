import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Map<String, dynamic>> data = [
  {
    'id': '1',
    // Moved slightly further to the north and east
    'position': LatLng(24.7336, 46.6853),
    'assetPath': 'lib/images/216.png',
  },
  {
    'id': '2',
    // Original central point
    'position': LatLng(24.7136, 46.6753),
    'assetPath': 'lib/images/216.png',
  },
  {
    'id': '3',
    // Moved slightly further to the south and west
    'position': LatLng(24.6936, 46.6653),
    'assetPath': 'lib/images/216.png',
  },
];

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 13,
  );

  @override
  void initState() {
    super.initState();
    _generateMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  Future<void> _generateMarkers() async {
    final Map<String, Marker> markers = {};

    for (var markerData in data) {
      final markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        markerData['assetPath'],
      );

      final markerId = markerData['id'];

      markers[markerId] = Marker(
        markerId: MarkerId(markerId),
        position: markerData['position'],
        icon: markerIcon,
        infoWindow: InfoWindow(title: 'Book Vending Machine $markerId'),
      );
    }

    setState(() {
      _markers.addAll(markers);
    });
  }
}




















































// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// List<Map<String, dynamic>> data = [
//   {
//     'id': '1',
//     'position': LatLng(24.7236, 46.6753),
//     'assetPath': 'lib/images/vending.png',
//   },
//   {
//     'id': '2',
//     'position': LatLng(24.7136, 46.6853),
//     'assetPath': 'lib/images/vending.png',
//   },
//   {
//     'id': '3',
//     'position': LatLng(24.7036, 46.6653),
//     'assetPath': 'lib/images/vending.png',
//   },
// ];

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   final Completer<GoogleMapController> _controller = Completer();
//   final Map<String, Marker> _markers = {};

//   static const CameraPosition _cameraPosition = CameraPosition(
//     target: LatLng(24.7136, 46.6753),
//     zoom: 12,
//   );

//   @override
//   void initState() {
//     _generateMarkers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: false,
//         initialCameraPosition: _cameraPosition,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: _markers.values.toSet(),
//       ),
//     );
//   }

//   _generateMarkers() async {
//     for (int i = 0; i < data.length; i++) {
//       BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
//         const ImageConfiguration(),
//         data[i]['assetPath'],
//       );
//       _markers[i.toString()] = Marker(
//         markerId: MarkerId(
//           i.toString(),
//         ),
//         position: data[i]['position'],
//         icon: markerIcon,
//         infoWindow: InfoWindow(title: 'book vending machine'),
//       );
//       setState(() {});
//     }
//   }
// }


// static const LatLng _centerRiyadh = LatLng(24.7136, 46.6753);
//   static const LatLng _pointNearRiyadh1 =
//       LatLng(24.7236, 46.6753); // Approximately 1 km to the north
//   static const LatLng _pointNearRiyadh2 =
//       LatLng(24.7136, 46.6853); // Approximately 1 km to the east
//   static const LatLng _pointNearRiyadh3 =
//       LatLng(24.7036, 46.6653); // Approximately 1 km to the south-west