// import 'package:flutter/material.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_microsoft_login/Send_otp.dart';
// import 'package:flutter_microsoft_login/video_screen.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import'dart:io' show Platform;
//
// import 'audio_screen.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: MyApp() ,
//   ),
//   );
// }
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final FlutterAppAuth _appAuth = FlutterAppAuth();
//   final String _clientId = 'b4b47313-22b0-4993-b9b9-a4725372df9e';
//   final String _redirectUrl = 'msauth://com.example.flutter_microsoft_login/VzSiQcXRmi2kyjzcA%2BmYLEtbGVs%3D';
//   //ios
//   // final String _redirectUrl = 'msauth.com.example.flutterMicrosoftLogin://auth';
//   final String _authority = 'https://login.microsoftonline.com/094d25ba-3306-4bc2-b789-6eb55f87b309';
//   final List<String> _scopes = ['openid', 'profile', 'email'];
//
//   String? _accessToken;
//   String? _name;
//
//   Map<String, dynamic>? _idTokenClaims;
//
//   Future<void> _loginAction() async {
//     try {
//       final AuthorizationTokenResponse? result = await _appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           _clientId,
//           _redirectUrl,
//           discoveryUrl: 'https://login.microsoftonline.com/common/v2.0/.well-known/openid-configuration',
//           scopes: ['openid', 'profile', 'offline_access'],
//           serviceConfiguration: AuthorizationServiceConfiguration(
//             authorizationEndpoint: 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
//             tokenEndpoint: 'https://login.microsoftonline.com/common/oauth2/v2.0/token',
//           ),
//         ),
//       );
//
//       setState(() {
//         _accessToken = result?.accessToken;
//       });
//       print(_accessToken);
//
// // Use the access token to make requests to Microsoft services
//       final http.Response response = await http.get(
//         Uri.parse('https://graph.microsoft.com/v1.0/me'),
//         headers: <String, String>{'Authorization': 'Bearer $_accessToken'},
//       );
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = jsonDecode(response.body);
//         setState(() {
//           _idTokenClaims = data;
//           _name =data?['displayName'].toString();
//         });
//         print('Venkatesh: $_idTokenClaims');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   Future<void> _logoutAction() async {
//     print('logout');
//     setState(() {
//       _accessToken = null;
//       _idTokenClaims = null;
//       _name = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter AppAuth Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               if (_accessToken != null)
//                 Column(
//                   children: <Widget>[
//                     const Text('Access Token'),
//                     Text('welcome'),
//                     const SizedBox(height: 20),
//                     if (_idTokenClaims != null)
//                       const Column(
//                         children: <Widget>[
//                           Text('ID Token Claims'),
//                           Text('venkatesh'),
//                         ],
//                       ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _logoutAction,
//                       child: const Text('Logout'),
//                     ),
//                   ],
//                 )
//               else
//                 ElevatedButton(
//                   onPressed: _loginAction,
//                   child: const Text('Login with Microsoft'),
//                 ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: 25, right: 25, top: 15, bottom: 0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height/19,
//                   width:MediaQuery.of(context).size.width/1.29,
//
//                   child: TextButton.icon(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape:RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return  SendOTPScreen();
//                       }));
//                     },
//                     icon: const Padding(
//                       padding: EdgeInsets.only(right:0.0,left:5),
//                       child: Icon(Icons.send_rounded,),
//                     ),
//                     label: const Padding(
//                       padding: EdgeInsets.only(left:10,right:30),
//                       child: Text('OTP',style: TextStyle(color:Colors.black87),),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: 25, right: 25, top: 15, bottom: 0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height/19,
//                   width:MediaQuery.of(context).size.width/1.29,
//
//                   child: TextButton.icon(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape:RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return  Audio_Screen();
//                       }));
//                     },
//                     icon: const Padding(
//                       padding: EdgeInsets.only(right:0.0,left:5),
//                       child: Icon(Icons.send_rounded,),
//                     ),
//                     label: const Padding(
//                       padding: EdgeInsets.only(left:10,right:30),
//                       child: Text('Audio',style: TextStyle(color:Colors.black87),),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: 25, right: 25, top: 15, bottom: 0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height/19,
//                   width:MediaQuery.of(context).size.width/1.29,
//
//                   child: TextButton.icon(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape:RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return  VideoPodcastListView();
//                       }));
//                     },
//                     icon: const Padding(
//                       padding: EdgeInsets.only(right:0.0,left:5),
//                       child: Icon(Icons.send_rounded,),
//                     ),
//                     label: const Padding(
//                       padding: EdgeInsets.only(left:10,right:30),
//                       child: Text('Video',style: TextStyle(color:Colors.black87),),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
//
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Image Picker Demo',
// //       home: HomePage(),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   File? imageFile;
// //
// //   final ImagePicker _picker = ImagePicker();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Image Picker"),
// //         ),
// //         body: imageFile == null
// //             ? Container(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Center(
// //                 child: Container(
// //                     height: 150,
// //                     width: 200,
// //                     child: Image.network(
// //                         'https://www.lifewire.com/thmb/P856-0hi4lmA2xinYWyaEpRIckw=/1920x1326/filters:no_u'
// //                             'pscale():max_bytes(150000):strip_icc()/cloud-upload-a30f385a928e44e199a62210d578375a.jpg')),
// //               ),
// //               Center(
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: MaterialButton(
// //                         onPressed: () {
// //                           imageFromGallery();
// //                         },
// //                         child: Text("GALLERY"),
// //                       ),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: MaterialButton(
// //                         onPressed: () {
// //                           imageFromCamera();
// //                         },
// //                         child: Text("CAMERA"),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         )
// //             : Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Text(
// //                     "Your Uploaded Image",
// //                     style: TextStyle(
// //                         color: Colors.black,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 20),
// //                   ),
// //                 ),
// //                 Container(
// //                   height: 200,
// //                   width: 200,
// //                   child: Image.file(
// //                     imageFile!,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ],
// //             )));
// //   }
// //
// //   imageFromGallery() async {
// //     PickedFile? pickedFile = await ImagePicker()
// //         .getImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
// //     if (pickedFile != null) {
// //       setState(() {
// //         imageFile = File(pickedFile.path);
// //       });
// //     }
// //   }
// //
// //   imageFromCamera() async {
// //     PickedFile? pickedFile = await ImagePicker()
// //         .getImage(source: ImageSource.camera, maxHeight: 200, maxWidth: 200);
// //     if (pickedFile != null) {
// //       setState(() {
// //         imageFile = File(pickedFile.path);
// //       });
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_microsoft_login/document_picker.dart';
//
// import 'login/bloc/login_bloc.dart';
// import 'login/bloc/login_event.dart';
// import 'login/bloc/login_state.dart';
// import 'login/bloc/mock_auth.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Login Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => LoginBloc(AuthService()),
//         child: LoginPage(),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatelessWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginFailure) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 SnackBar(content: Text(state.error)),
//               );
//           } else if (state is LoginSuccess) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 SnackBar(content: Text('Login successful')),
//               );
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DocumentPickerScreen()),
//             );
//           }
//         },
//         child: BlocBuilder<LoginBloc, LoginState>(
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Enter your email',
//                     ),
//                     controller: _emailController,
//                   ),
//                   SizedBox(height: 16.0),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Enter your password',
//                     ),
//                     obscureText: true,
//                     controller: _passwordController,
//                   ),
//                   SizedBox(height: 32.0),
//                   BlocBuilder<LoginBloc, LoginState>(
//                     builder: (context, state) {
//                       return state is LoginLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                         onPressed: () {
//                           BlocProvider.of<LoginBloc>(context).add(
//                             LoginButtonPressed(
//                               email: _emailController.text,
//                               password: _passwordController.text,
//                             ),
//                           );
//                         },
//                         child: Text('Login'),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_microsoft_login/document_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Document Picker Example',
//       home: DocumentPickerScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_microsoft_login/document_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'date_range_picker.dart';
// import 'DatePicker/date_range_picker_bloc.dart';
// import 'documentPicker/document_picker_bloc.dart';
// import 'login/bloc/login_bloc.dart';
// import 'login/bloc/login_event.dart';
// import 'login/bloc/login_state.dart';
// import 'login/bloc/mock_auth.dart';
//
// void main() {
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(
//           create: (context) => LoginBloc(AuthService()),
//         ),
//         BlocProvider<DocumentPickerBloc>(
//           create: (context) => DocumentPickerBloc(),
//         ),
//         BlocProvider<DateRangePickerBloc>(
//           create: (context) => DateRangePickerBloc(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   final AuthService _authService = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: _authService.isLoggedIn(),
//       builder: (context, snapshot) {
//           // User is not logged in, show LoginPage
//           return MaterialApp(
//             title: 'Flutter Login Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: SplashScreen(),
//           );
//
//       },
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _initializeApp();
//   }
//
//   Future<void> _initializeApp() async {
//     // Wait for 3 seconds
//     await Future.delayed(Duration(seconds: 3));
//
//     // Check if the user is already logged in
//     final AuthService _authService = AuthService();
//     final isLoggedIn = await _authService.isLoggedIn();
//
//     // Navigate to the appropriate screen based on the user's login status
//     if (isLoggedIn) {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (BuildContext context) => DateRangePickerWidget(),
//       ));
//     } else {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (BuildContext context) => BlocProvider(
//           create: (context) => LoginBloc(AuthService()),
//           child: LoginPage(),
//         ),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset("assets/images/optisolLogo.png"),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   bool _isPasswordHidden = true;
//
//   void _togglePasswordVisibility() {
//     setState(() {
//       _isPasswordHidden = !_isPasswordHidden;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool _validateInputs() {
//       if (_emailController.text.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please enter your email')),
//         );
//         return false;
//       } else if (_passwordController.text.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please enter your password')),
//         );
//         return false;
//       }
//       return true;
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginFailure) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 SnackBar(content: Text(state.error)),
//               );
//           } else if (state is LoginSuccess) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 SnackBar(content: Text('Login successful')),
//               );
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DocumentPickerScreen()),
//             );
//           }
//         },
//         child: BlocBuilder<LoginBloc, LoginState>(
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Enter your email',
//                     ),
//                     controller: _emailController,
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Enter your password',
//                       suffixIcon: IconButton(
//                         icon: Icon(_isPasswordHidden
//                             ? Icons.visibility_off
//                             : Icons.visibility),
//                         onPressed: _togglePasswordVisibility,
//                       ),
//                     ),
//                     obscureText: _isPasswordHidden,
//                     controller: _passwordController,
//                   ),
//                   SizedBox(height: 32.0),
//                   BlocBuilder<LoginBloc, LoginState>(
//                     builder: (context, state) {
//                       return state is LoginLoading
//                           ? const CircularProgressIndicator()
//                           : ElevatedButton(
//                         onPressed: () {
//                           if (_validateInputs()) {
//                             BlocProvider.of<LoginBloc>(context).add(
//                               LoginButtonPressed(
//                                 email: _emailController.text,
//                                 password: _passwordController.text,
//                               ),
//                             );
//                           }
//                         },
//                         child: Text('Login'),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bottomsheet/bottom_sheet_bloc.dart';
// import 'bottomsheet/widget/bottom_sheet_widget.dart';
// import 'date_range_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final BottomSheetBloc bottomSheetBloc = BottomSheetBloc();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Date Range Picker Demo',
//       home: BlocProvider.value(
//         value: bottomSheetBloc,
//         child: const BottomSheetWidget(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'DatePicker/date_range_picker_bloc.dart';
// import 'TimePicker/time_picker_bloc.dart';
// import 'TimePicker/widget/time_picker_widget.dart';
// import 'date_range_picker.dart';
// import 'google_map_integration/location_bloc.dart';
// import 'google_map_integration/widget/location_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Date Range Picker Demo',
//       home: Scaffold(
//         body: BlocProvider(
//           create: (context) => LocationBloc(),
//           child:LocationWidget(),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'google_map_integration/location_bloc.dart';
// import 'google_map_integration/widget/location_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Location Demo',
//       home: Scaffold(
//         body: BlocProvider(
//           create: (context) => LocationBloc(),
//           child: LocationWidget(),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import 'RatingBar/rating_bar_bloc.dart';
// import 'RatingBar/widget/rating_bar_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final RatingBloc ratingBloc = RatingBloc();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Rating Bar App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My Rating Bar'),
//         ),
//         body: Center(
//           child: MyRatingBar(ratingBloc: ratingBloc),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_bloc.dart';
// import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_event.dart';
// import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_state.dart';
// import 'package:flutter_microsoft_login/slider/slider_bloc.dart';
// import 'package:flutter_microsoft_login/slider/widget/slider_widget.dart';
//
// import 'PageViewBuilder/widget/pageview_builder_widget.dart';
// import 'RangeSlider/range_slider_bloc.dart';
// import 'RangeSlider/widget/range_slider_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: BlocProvider(
//         create: (_) => RangeSliderBloc(),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('My Page View'),
//           ),
//           body: RangeSliderWidget(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_microsoft_login/Carousel/carouselBloc.dart';
import 'Animation/widget/animation_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Carousel/widget/Carousel_widget.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: BlocProvider(
        create: (_) => CarouselBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Page View'),
          ),
          body: CarouselPage(),
        ),
      ),
    );
  }
}








