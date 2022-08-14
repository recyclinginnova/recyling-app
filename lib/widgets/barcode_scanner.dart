import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class LiveBarcodeScanner extends StatefulWidget{
  final Function(String) callback;

  const LiveBarcodeScanner({Key? key, required this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LiveBarcodeScanner();
}

class _LiveBarcodeScanner extends State<LiveBarcodeScanner>{

  final ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScanView(
        controller: controller,
        scanLineColor: Colors.greenAccent,
        onCapture: (code){
          setState(() {
            widget.callback(code);
          });
        },
      ),
    );
  }
}