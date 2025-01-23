import 'dart:async';
import 'package:camera/camera.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/widgets/cameras/camera_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late Timer _timer;
  int _selectedCameraIndex = 0;
  String _currentTime = _getCurrentTime();

  static String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      widget.cameras[_selectedCameraIndex],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  void _switchCamera() {
    setState(() {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
      _initializeCamera();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    _currentTime,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.labelTextColor,
                      fontSize: 40,
                    )),
                  ),
                  // Instruction Text
                  Text(
                    "Pastikan Nampak Wajah",
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(height: 10),
                  // Camera Preview Container with AspectRatio
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: CameraPreview(_controller),
                        ),
                      ),
                    ),
                  ),
                  // Capture Button and Switch Camera Button Row
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.thirdColor,
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.cameraswitch),
                            color: AppColors.thirdColor,
                            iconSize: 40,
                            onPressed: _switchCamera,
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(16),
                              iconColor: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.thirdColor,
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, size: 40),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(16),
                              iconColor: Colors.black,
                            ),
                            onPressed: () async {
                              try {
                                final image = await _controller.takePicture();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConfirmPhotoScreen(
                                        imagePath: image.path,
                                        currentTime: _getCurrentTime()),
                                  ),
                                );
                              } catch (e) {
                                print("Error taking picture: $e");
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.white, size: 40),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Kamera tidak tersedia"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
