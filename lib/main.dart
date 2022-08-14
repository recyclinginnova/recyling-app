import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclingapp/screens/barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling App',
      theme: _buildTheme(),
      home: const BarcodeScannerScreen()
    );
  }

  ThemeData _buildTheme(){
    var baseTheme = ThemeData(
        primarySwatch: Colors.blue
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme)
    );
  }
}