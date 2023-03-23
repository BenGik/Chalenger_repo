import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/actions_bottom_sheet.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_actions.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/writting_comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';


class OnProfileVideoViewScreen extends StatefulWidget {
  const OnProfileVideoViewScreen({
    super.key,
    // required this.videoPath
    });
  // final XFile videoPath;

  @override
  State<OnProfileVideoViewScreen> createState() => _OnProfileVideoViewScreenState();
}

class _OnProfileVideoViewScreenState extends State<OnProfileVideoViewScreen> {
  OnProfileVideoController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.onProfileVideoController.initialize().then((_) =>
    controller.onProfileVideoController.play());
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnProfileVideoController>(
      builder: (_) {
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
                    child: controller.onProfileVideoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controller.onProfileVideoController.value.aspectRatio,
                          child: VideoPlayer(controller.onProfileVideoController),
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
                        controller.onProfileVideoController.value.isPlaying
                        ? controller.onProfileVideoController.pause()
                        : controller.onProfileVideoController.play();
                      });
                    },
                    onLongPress: () => showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const ActionsBottomSheet()
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: controller.onProfileVideoController.value.isPlaying ? const SizedBox(width: 0)
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
                  bottom: Dimentions.height54,
                  right: 0,
                  left: Dimentions.width10,
                  child: Visibility(
                    visible: controller.onProfileVideoController.value.isPlaying || controller.onProfileVideoController.value.duration.inSeconds <= 15 ? false : true,
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
                  bottom: Dimentions.height20*2.5,
                  right: Dimentions.width10,
                  left: Dimentions.width10,
                  child: Visibility(
                    visible: controller.onProfileVideoController.value.duration.inSeconds <= 15 ? false : true,
                    child: Transform.scale(
                      scaleY:controller.onProfileVideoController.value.isPlaying? 0.2 : 1,
                      child: VideoProgressIndicator(
                        controller.onProfileVideoController,
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
                ),
                Positioned(
                  bottom: Dimentions.height15,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimentions.width10,
                          right: Dimentions.width20
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => const WrittingCommentBottomSheet()
                              ),
                              child: Text(
                                tr(context)!.add_comment,
                                style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimentions.fsz16,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text("@",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontWeight: FontWeight.w900,
                                        fontSize: Dimentions.fsz10*2,
                                      ),
                                    )
                                  ),
                                ),
                                SizedBox(width: Dimentions.width15),
                                GestureDetector(
                                  onTap: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.qrcode,
                                    color: Colors.white.withOpacity(0.5),
                                    size: Dimentions.size24,
                                  )
                                ),
                                SizedBox(width: Dimentions.width15),
                                GestureDetector(
                                  onTap: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.white.withOpacity(0.5),
                                    size: Dimentions.size24,
                                  )
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ),
          )
        );
      }
    );
  }
}