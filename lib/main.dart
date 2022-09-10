import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclingapp/screens/barcode_scanner.dart';
import 'package:recyclingapp/screens/home.dart';
import 'package:recyclingapp/screens/material_info.dart';
import 'package:recyclingapp/screens/map.dart';

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
  int index = 0;
  // screens which the navbar will redirect to
  List<Widget> screens = [const Home() , const BarcodeScannerScreen(), const Materials(), const Map()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recycling App',
        theme: _buildTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Recycling App',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: screens[index],
          // changed font size to be more readable
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
              ),
            ), 
            child: NavigationBar(
              height: 64,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home), 
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.document_scanner_outlined),
                    // NOTE: better icon needs to be found for barcode scanner (fix later not important now)
                    label: 'Barcode Scanner'),
                NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Materials'),
                NavigationDestination(
                    icon: Icon(Icons.location_on),
                    label: 'Map'),
              ]),) 
        ));
  }



  ThemeData _buildTheme() {
    var baseTheme = ThemeData(primarySwatch: Colors.green);

    return baseTheme.copyWith(
        textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme));
  }
}




