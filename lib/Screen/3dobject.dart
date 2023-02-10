import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class spaceObjects extends StatefulWidget {
  const spaceObjects({Key? key}) : super(key: key);

  @override
  State<spaceObjects> createState() => _spaceObjectsState();
}

class _spaceObjectsState extends State<spaceObjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'asset/object/world.obj'));
          },
        ),
      ),
    );
  }
}
