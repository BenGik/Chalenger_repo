import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/actions_bottom_sheet.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_actions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';


// late VideoPlayerController mainVideoPlayerController;

class VideoWidget extends StatefulWidget {
  // final String video;
  const VideoWidget({
    super.key,
    // required this.video
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  MainVideoController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.mainVideoPlayerController.initialize().then((_) =>
    controller.mainVideoPlayerController.play());
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainVideoController>(
      builder:(_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Center(
                    child: controller.mainVideoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controller.mainVideoPlayerController.value.aspectRatio,
                          child: VideoPlayer(controller.mainVideoPlayerController),
                        )
                      : Container(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                        controller.mainVideoPlayerController.value.isPlaying
                        ? controller.mainVideoPlayerController.pause()
                        : controller.mainVideoPlayerController.play();
                    },
                    onLongPress: () =>showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const ActionsBottomSheet()
                    ),
                    onDoubleTap: () => setState(() {
                      clearMode = !clearMode;
                    }),
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: controller.mainVideoPlayerController.value.isPlaying ? const SizedBox(width: 0)
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
                  bottom: Dimentions.height54+Dimentions.height10,
                  right: 0,
                  left: Dimentions.width10,
                  child: Visibility(
                    visible: controller.mainVideoPlayerController.value.isPlaying || controller.mainVideoPlayerController.value.duration.inSeconds <= 20 ? false : true,
                    child: Row(
                      children: [
                        Text(
                          controller.position(),
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimentions.fsz14,
                            )
                          )
                        ),
                        Text(
                          " / ",
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimentions.fsz14,
                            )
                          )
                        ),
                        Text(
                          controller.duration(),
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimentions.fsz14,
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: Dimentions.height54+Dimentions.height15/2,
                  right: Dimentions.width10,
                  left: Dimentions.width10,
                  child: Visibility(
                    visible: controller.mainVideoPlayerController.value.duration.inSeconds <= 20 ? false : true,
                    child: Transform.scale(
                      scaleY:controller.mainVideoPlayerController.value.isPlaying? 0.3 : 0.7,
                      child: VideoProgressIndicator(
                        controller.mainVideoPlayerController,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.white,
                          bufferedColor: Colors.white.withOpacity(0.3),
                          backgroundColor: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !clearMode,
                  child: const VideoActions()
                )
              ]
            ),
          )
        );
      }
    );
  }
  void like () {

  }
}