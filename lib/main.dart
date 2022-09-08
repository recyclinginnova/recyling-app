import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclingapp/screens/barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// NOTE: Currently navbar doesn't relocate to different screens, will fix in future
class _MyAppState extends State<MyApp> {
  int index = 0;
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
          // NOTE: need to change font of navbar
          bottomNavigationBar: NavigationBar(
              height: 60,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home), 
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.document_scanner_outlined),
                    label: 'Barcode Scanner'),
                NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Materials'),
                NavigationDestination(
                    icon: Icon(Icons.location_on),
                    label: 'Map'),
              ]),
        ));
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(primarySwatch: Colors.green);

    return baseTheme.copyWith(
        textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme));
  }
}

// test for NavBar

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('Placeholder for HomeScreen'),)
    );
  }
}

class Materials extends StatelessWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('Placeholder for Materials Screen'),)
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('Placeholder for Map Screen'),)
    );
  }
}


