import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'vision_detector_views/barcode_scanner_view.dart';
import 'vision_detector_views/object_detector_view.dart';
import 'vision_detector_views/text_detector_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ML App-Team 9-CSE:C'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                      'TEAM 9 MEMBERS: \n K Sambhu Prasad - 19H61A05E1 \n M Rela Lumbini - 19H61A05F0 \n P Srihith - 19H61A05F6'),
                  ExpansionTile(
                    title: const Text('Click Here To Use ML Services!📱'),
                    children: [
                      CustomCard(
                          'Start Barcode Scanner ⚡', BarcodeScannerView()),
                      CustomCard(
                          'Start Object Detection 💡', ObjectDetectorView()),
                      CustomCard(
                          'Start Text Recognition 💬', TextRecognizerView()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    const Text('This feature has not been implemented yet')));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}
