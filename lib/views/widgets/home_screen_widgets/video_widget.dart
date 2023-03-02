import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/routes.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/screens/creator_profile_screen.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/actions_bottom_sheet.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_actions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';


late VideoPlayerController mainVideoPlayerController;
final pauseVideo = mainVideoPlayerController.pause();

class VideoWidget extends StatefulWidget {
  final String video;
  const VideoWidget({
    super.key,
    required this.video
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  double avancement = 0;

  @override
  void initState() {
    mainVideoPlayerController = VideoPlayerController.asset(widget.video)
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((_) => mainVideoPlayerController.play());
    super.initState();
  }

  String position () {
      final duration = Duration(
        milliseconds: mainVideoPlayerController.value.position.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
    }
    String duration () {
      final duration = Duration(
        milliseconds: mainVideoPlayerController.value.duration.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
    }

    @override
  void dispose() {
    mainVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
                child: mainVideoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: mainVideoPlayerController.value.aspectRatio,
                      child: VideoPlayer(mainVideoPlayerController),
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
                  setState(() {
                    mainVideoPlayerController.value.isPlaying
                    ? mainVideoPlayerController.pause()
                    : mainVideoPlayerController.play();
                  });
                },
                onLongPress: () =>showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const ActionsBottomSheet()
                ),
                onDoubleTap: () => Navigator.push(context, PageRoutes2(child: const CreatorProfile())),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: mainVideoPlayerController.value.isPlaying ? const SizedBox(width: 0)
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
                visible: mainVideoPlayerController.value.isPlaying || mainVideoPlayerController.value.duration.inSeconds < 20 ? false : true,
                child: Row(
                  children: [
                    Text(
                      position(),
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
                      duration(),
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
                visible: mainVideoPlayerController.value.duration.inSeconds < 20 ? false : true,
                child: Transform.scale(
                  scaleY:mainVideoPlayerController.value.isPlaying? 0.3 : 0.7,
                  child: VideoProgressIndicator(
                    mainVideoPlayerController,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.white,
                      bufferedColor: Colors.white.withOpacity(0.3),
                      backgroundColor: Colors.white.withOpacity(0.2)
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
}



class CustumScrollView extends StatelessWidget {
  const CustumScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 340,
            backgroundColor: Colors.blue,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: Dimentions.r50,
              backgroundColor: Colors.grey.withOpacity(0.2),
              backgroundImage: const AssetImage('assets/images/i_4.jpg'),
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("@username",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: Dimentions.fsz15,
                    ),
                  ),
                  maxLines: 1,
                )
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("1",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.following,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("3",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.followers,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("5",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.likes,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(Dimentions.r5)
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimentions.height10,
                    horizontal: Dimentions.width50
                  ),
                  child: Text(
                    tr(context)!.follow,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz15,
                      ),
                    ),
                  ),
                ),]
            ),]
          )
        ),
        ],
    )
    );
  }
}