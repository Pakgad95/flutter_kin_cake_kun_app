import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/views/cake_shop_detail_ui.dart';
import 'package:flutter_kin_cake_kun_app/views/cake_shop_list_ui.dart';
import 'package:flutter_kin_cake_kun_app/views/splash_screen_ui.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     FlutterKinCakeKunApp (),
    );
}
class FlutterKinCakeKunApp extends StatefulWidget {
  const FlutterKinCakeKunApp({super.key});

  @override
  State<FlutterKinCakeKunApp> createState() => _FlutterKinCakeKunAppState();
}

class _FlutterKinCakeKunAppState extends State<FlutterKinCakeKunApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
           textTheme: GoogleFonts.promptTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.purple,
      ),
    );
  }
}