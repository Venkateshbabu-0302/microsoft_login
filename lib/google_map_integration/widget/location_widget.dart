// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../location_bloc.dart';
// import '../location_state.dart';
// import '../location_event.dart';
//
// class LocationWidget extends StatefulWidget {
//   @override
//   _LocationWidgetState createState() => _LocationWidgetState();
// }
//
// class _LocationWidgetState extends State<LocationWidget> {
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermissionAndGetCurrentLocation();
//   }
//   void _checkPermissionAndGetCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: Text('Location Permissions'),
//             content: Text('The app needs access to your device\'s location to function properly.'),
//             actions: <Widget>[
//               MaterialButton(
//                 child: Text('CANCEL'),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               MaterialButton(
//                 child: Text('SETTINGS'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Geolocator.openAppSettings();
//                 },
//               ),
//             ],
//           ),
//         );
//         return;
//       }
//     }
//     if (permission == LocationPermission.whileInUse ||
//         permission == LocationPermission.always) {
//       BlocProvider.of<LocationBloc>(context).add(GetCurrentLocation());
//     }
//   }
//
//   // void _checkPermissionAndGetCurrentLocation() async {
//   //   LocationPermission permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied ||
//   //       permission == LocationPermission.deniedForever) {
//   //     permission = await Geolocator.requestPermission();
//   //   }
//   //   if (permission == LocationPermission.whileInUse ||
//   //       permission == LocationPermission.always) {
//   //     BlocProvider.of<LocationBloc>(context).add(GetCurrentLocation());
//   //   } else {
//   //     // Handle denied permission
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LocationBloc, LocationState>(
//       builder: (context, state) {
//         if (state is LocationInitial) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is LocationLoaded) {
//           return _buildMap(context, state.position, state.balance);
//         } else if (state is LocationError) {
//           return Center(
//             child: Text(
//               state.message,
//               style: TextStyle(fontSize: 16.0, color: Colors.red),
//             ),
//           );
//         }
//         return Container();
//       },
//     );
//   }
//
//   Widget _buildMap(BuildContext context, Position position, double balance) {
//     LatLng latLng = LatLng(position.latitude, position.longitude);
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: latLng,
//         zoom: 15,
//       ),
//       markers: {
//         Marker(
//           markerId: MarkerId("current_position"),
//           position: latLng,
//         ),
//       },
//       circles: {
//         Circle(
//           circleId: CircleId("balance_circle"),
//           center: latLng,
//           radius: balance,
//           fillColor: Colors.blue.withOpacity(0.1),
//           strokeWidth: 0,
//         ),
//       },
//     );
//   }
// }
