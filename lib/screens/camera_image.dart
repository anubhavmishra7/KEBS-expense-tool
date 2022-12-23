import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraImages extends StatefulWidget {
  const CameraImages({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<CameraImages> createState() => _CameraImagesState();
}

class _CameraImagesState extends State<CameraImages> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  // @override
  // void initState(){

  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // Future<void> camera() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!mounted) return;

            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisplayPicture(imagePath: image.path)));
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}

class DisplayPicture extends StatelessWidget {
  final String imagePath;
  const DisplayPicture({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(imagePath)),
    );
  }
}
