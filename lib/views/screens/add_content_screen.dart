import 'dart:math';
import 'package:camera/camera.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/routes.dart';
import 'package:chalenger/views/screens/home_screen.dart';
import 'package:chalenger/views/widgets/add_contents_screen_widgets/pictures_preview.dart';
import 'package:chalenger/views/widgets/add_contents_screen_widgets/gallery.dart';
import 'package:chalenger/views/widgets/add_contents_screen_widgets/video_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


late List<CameraDescription> cameras;

class AddContentSreen extends StatefulWidget {
  const AddContentSreen({super.key});

  @override
  State<AddContentSreen> createState() => _AddContentSreenState();
}

class _AddContentSreenState extends State<AddContentSreen> {

  late CameraController _cameracontroller;
  late Future<void> cameraValue;
  bool isRecordingVideo = false;
  bool flashIsactive = false;
  bool isCameraFront = true;
  double transforme = 0;

  @override
  void initState() {
    super.initState();
    _cameracontroller = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = _cameracontroller.initialize();
  }

  @override
  void dispose() {
    _cameracontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF010212),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                Navigator.of(context).pushReplacement(PageRoutes2(child: const HomeScreen())),
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
                size: Dimentions.size24
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
          children: [
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(bottom: 40),
            child: FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameracontroller);
                }else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: Dimentions.width5,
                    ),
                  );
                }
              }
            ),
          ),
          Positioned(
            top: Dimentions.height50 + Dimentions.height5,
            right: Dimentions.width10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ()  {
                    setState(() {
                      isCameraFront = !isCameraFront;
                      transforme = transforme + pi;
                    });
                    int cameraPost = isCameraFront? 0 : 3;
                    _cameracontroller = CameraController(cameras[cameraPost], ResolutionPreset.max);
                    cameraValue = _cameracontroller.initialize();
                  },
                  child: Transform.rotate(
                    angle: transforme,
                    child: FaIcon(
                      FontAwesomeIcons.rotate,
                      color: Colors.white,
                      size: Dimentions.size24,
                    ),
                  ),
                ),
                SizedBox(height: Dimentions.height20),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      flashIsactive = !flashIsactive;
                    });
                    flashIsactive ? _cameracontroller.setFlashMode(FlashMode.torch)
                    : _cameracontroller.setFlashMode(FlashMode.off);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.boltLightning,
                    color: flashIsactive?Colors.amber[200] : Colors.white,
                    size: Dimentions.size24,
                  ),
                ),
              ],
            )
          ),
          Positioned(
            bottom: 50,
            right: Dimentions.width70,
            left: Dimentions.width70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidSquare,
                  color: Colors.white,
                  size: Dimentions.size15*2,
                ),
                GestureDetector(
                  onTap: () => takePhoto(context),
                  onLongPress: () async {
                    await _cameracontroller.startVideoRecording();
                    setState(() => isRecordingVideo = true);
                  },
                  onLongPressUp: () async {
                    XFile videoPath = await _cameracontroller.stopVideoRecording();
                    setState(() => isRecordingVideo = false);
                    Get.to(VideoPreview(videoPath: videoPath));
                  },
                  child: isRecordingVideo ? FaIcon(
                    FontAwesomeIcons.circleDot,
                    color: Colors.redAccent,
                    size: Dimentions.size20*4,
                  )
                  :FaIcon(
                    FontAwesomeIcons.circle,
                    color: Colors.white,
                    size: Dimentions.size20*4,
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(PageRoutes2(child: const GalleryPage())),
                      child: FaIcon(
                        FontAwesomeIcons.solidSquare,
                        color: Colors.white,
                        size: Dimentions.size15*2,
                      ),
                    ),
                  ],
                ),
              ],
            )
          )
        ],
      )
    );
  }
  void takePhoto(context) async {
    if (!_cameracontroller.value.isInitialized) {
      return null;
    }
    if (_cameracontroller.value.isTakingPicture) {
      return null;
    }
    if (_cameracontroller.value.isRecordingVideo) {
      return null;
    }
    if (_cameracontroller.value.isRecordingPaused) {
      return null;
    }
    try {
      XFile file = await _cameracontroller.takePicture();
      Navigator.of(context).push(PageRoutes2(child: PicturesPreviewPage(file: file)));
    } on CameraException catch (e) {
      SnackBar(
        duration: const Duration(seconds: 1),
        elevation: 1,
        width: 350,
        margin: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.height)/2,
          left: (MediaQuery.of(context).size.width - 350)/2
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        backgroundColor: Colors.white,
        content: Text(
          "erreur camera: $e",
          style: const TextStyle(
            color: Colors.black
          ),
        )
      );
      return null;
    }
  }


  void recordVideo(context) async {
    if (!_cameracontroller.value.isInitialized) {
      return null;
    }
    if (_cameracontroller.value.isTakingPicture) {
      return null;
    }
    if (_cameracontroller.value.isRecordingVideo) {
      return null;
    }
    if (_cameracontroller.value.isRecordingPaused) {
      return null;
    }
    try {
      await _cameracontroller.startVideoRecording();
    } on CameraException catch (e) {
      SnackBar(
        duration: const Duration(seconds: 1),
        elevation: 1,
        width: 350,
        margin: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.height)/2,
          left: (MediaQuery.of(context).size.width - 350)/2
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        backgroundColor: Colors.white,
        content: Text(
          "erreur camera: $e",
          style: const TextStyle(
            color: Colors.black
          ),
        )
      );
      return null;
    }
  }
}