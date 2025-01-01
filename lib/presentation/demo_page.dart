import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_3d_example/domain/models/object_model.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final objects = [
    ObjectModel(
      name: 'Christmas Ball',
      path: 'assets/3d/ball.obj',
      url: '',
    ),
    ObjectModel(
      name: 'iPad Stand',
      path: 'assets/3d/ipad_stand.obj',
      url: 'https://www.thingiverse.com/thing:1517164',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final object = objects[1];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(object.name),
            Expanded(
              child: Flutter3DViewer.obj(
                src: object.path,
                scale: 5, // Initial scale of obj model

                cameraX: 0, // Initial cameraX position of obj model

                cameraY: 0, // Initial cameraY position of obj model

                cameraZ: 10, // Initial cameraZ position of obj model

                //This callBack will return the loading progress value between 0 and 1.0
                onProgress: (double progressValue) {
                  debugPrint('model loading progress : $progressValue');
                },

                //This callBack will call after model loaded successfully and will return model address
                onLoad: (String modelAddress) {
                  debugPrint('model loaded : $modelAddress');
                },

                //this callBack will call when model failed to load and will return failure erro
                onError: (String error) {
                  debugPrint('model failed to load : $error');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
