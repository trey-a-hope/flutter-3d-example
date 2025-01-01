import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Obj {
  final String name;
  final String path;

  Obj({
    required this.name,
    required this.path,
  });
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final objects = [
    Obj(
      name: 'Christmas Ball',
      path: 'assets/3d/ball.obj',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(objects.first.name),
              Expanded(
                child: Flutter3DViewer.obj(
                  src: objects.first.path,
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
