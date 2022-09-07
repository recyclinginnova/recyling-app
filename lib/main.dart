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
  final pages = [
    const Center(child: Text('test')),
    const Center(child: Text('test2'))
  ];

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
          body: pages[index],
          // NOTE: need to change font of navbar
          bottomNavigationBar: NavigationBar(
              height: 60,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.document_scanner_outlined),
                    label: 'Barcode Scanner'),
              ]),
        ));
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(primarySwatch: Colors.green);

    return baseTheme.copyWith(
        textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme));
  }
}
