import 'package:camera/camera.dart';
import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';


class VideoPreview extends StatefulWidget {
  const VideoPreview({
    super.key,
    required this.videoPath
    });
  final XFile videoPath;

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  VideoPreviewController controller = Get.find();
  @override
  void initState() {
    super.initState();
      controller.videoPreviewController.initialize().then((_) {
        setState(() {
          controller.videoPreviewController.play();
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF010212),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 70,
              child: Center(
                child: controller.videoPreviewController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.videoPreviewController.value.aspectRatio,
                      child: VideoPlayer(controller.videoPreviewController),
                    )
                  : Container(),
              ),
            ),
            Positioned(
              bottom: 70,
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    controller.videoPreviewController.value.isPlaying
                    ? controller.videoPreviewController.pause()
                    : controller.videoPreviewController.play();
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: controller.videoPreviewController.value.isPlaying ? const SizedBox(width: 0)
                    : FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white.withOpacity(0.8),
                      size: Dimentions.size20*2,
                    ),
                  ),
                ),
              )
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom + Dimentions.height10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Dimentions.width150*2+Dimentions.width40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(Dimentions.r25)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimentions.width10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.white.withOpacity(0.8),
                                        size: Dimentions.size24,
                                      )
                                    ),
                                    SizedBox(width: Dimentions.width15),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text("@",
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            color: Colors.white.withOpacity(0.8),
                                            fontWeight: FontWeight.w900,
                                            fontSize: Dimentions.fsz10*2,
                                          ),
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: Dimentions.width5),
                                Expanded(
                                  child: TextField(
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimentions.fsz15,
                                      ),
                                    ),
                                    cursorHeight: Dimentions.height25,
                                    textAlignVertical: TextAlignVertical.center,
                                    autofocus: false,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      hintText: tr(context)!.add_comment,
                                      hintStyle: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Dimentions.fsz15,
                                        ),
                                      ),
                                      fillColor: Colors.transparent,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: Dimentions.width10
                                      ),
                                      border: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            )
                          )
                        ),
                        CircleAvatar(
                          radius: Dimentions.r20/5*6,
                          backgroundColor: Color(0xFF1ECFC3),
                          child: FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                            size: Dimentions.size24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}