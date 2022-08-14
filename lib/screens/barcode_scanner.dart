import 'package:flutter/material.dart';
import 'package:recyclingapp/widgets/barcode_scanner.dart';

class BarcodeScannerScreen extends StatelessWidget{

  const BarcodeScannerScreen({Key? key}) : super(key: key);

  callback(code){
    debugPrint("$code detected!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LiveBarcodeScanner(callback: callback,)
        ),
      );
  }
}