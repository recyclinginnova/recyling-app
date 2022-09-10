import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclingapp/screens/barcode_scanner.dart';
import 'package:recyclingapp/screens/home.dart';
import 'package:recyclingapp/screens/material_info.dart';
import 'package:recyclingapp/screens/map.dart';
import 'package:recyclingapp/widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // intial index so that screens[0] is first screen shown to users
  int screenIndex = 0;
  // screens which the navbar will redirect to
  List<Widget> screens = [const Home() , const BarcodeScannerScreen(), const Materials(), const Map()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recycling App',
        theme: _buildTheme(),
        home: Scaffold(
        body: screens[screenIndex],
        bottomNavigationBar: NavBar(onNav: (screenIndex) => setState(() => this.screenIndex  = screenIndex ))
        )
      );
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(primarySwatch: Colors.green);

    return baseTheme.copyWith(
        textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme));
  }
}




