import 'package:flutter/material.dart';
import 'package:twitter_qr_scanner/twitter_qr_scanner.dart';
import 'package:twitter_qr_scanner/QrScannerOverlayShape.dart';
import 'package:url_launcher/url_launcher.dart';

class QrReader extends StatefulWidget {
  @override
  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {

  GlobalKey qrKey = GlobalKey();
  QRViewController controller;
  bool _flashMode = false;

  _checkQrCode(String scanData) async {
    var url;
  if (scanData == "DuZE7fuFUQf8dDAK72CZ") {
    setState(() {
      url = "https://fortline-demo.633k.com.br/";
    });
  } else if(scanData == "ulDOS2N9jpqP3GZogjMn"){
      url = "https://fortline-demo.633k.com.br/quiz";
  }
    if (await canLaunch(url) && url != null) {
      await launch(url);
    } else {
      throw 'Não pde abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderRadius: 16,
                  borderColor: Colors.white,
                  borderLength: 120,
                  borderWidth: 10,
                  cutOutSize: 250),
              onQRViewCreated: _onQRViewCreate,
              data: "FortLine",
            ),
            Positioned(
              bottom: 16,
                left: 0,
                right: 0,
                child: IconButton(icon: _flashMode == false
                    ? Icon(Icons.flash_off, color: Colors.white70, size: 30,)
                    : Icon(Icons.flash_on, color: Colors.white70, size: 30,),
                    onPressed: (){
                  if(_flashMode == false){
                    setState(() {
                      controller.toggleFlash();
                      _flashMode = true;
                    });
                  } else{
                    setState(() {
                      controller.toggleFlash();
                      _flashMode = false;
                    });
                  }
                    }
                )
            )
          ],
        )
    );
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      _checkQrCode(scanData);
    });
  }
}