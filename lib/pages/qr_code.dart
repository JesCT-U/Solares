import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});
  @override
  State<QRCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QRCode> {
  String _data = "";
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () => _scan(),
            child: const Text('Click Escanear'),
          ),
          Text(_data)
        ],
      ),
    );
  }
}
