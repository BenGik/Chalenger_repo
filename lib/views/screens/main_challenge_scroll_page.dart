import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/screens/following_screen.dart';
import 'package:chalenger/views/screens/story_screen.dart';
import 'package:chalenger/views/screens/of_the_week_sreen.dart';
import 'package:chalenger/views/screens/research_screen.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chalenger/utils/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class MainChallengeScrollPage extends StatefulWidget {
  const MainChallengeScrollPage({super.key});

  @override
  State<MainChallengeScrollPage> createState() => _MainChallengeScrollPageState();
}

class _MainChallengeScrollPageState extends State<MainChallengeScrollPage> 
  with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    MainVideoController controller = Get.find();
    TabController tabController = 
    TabController(initialIndex: 3, length: 4, vsync: this);
    return GetBuilder<MainVideoController>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF010212),
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xFF010212),
              systemNavigationBarIconBrightness: Brightness.light
            ),
            leading: Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.display,
                      color: Colors.white,
                      size: Dimentions.size20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Dimentions.height2*2
                    ),
                    child: Text(
                      "LIVE",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w900,
                          fontSize: Dimentions.fsz12/1.8,
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: Dimentions.width10, right: Dimentions.width10),
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.white70,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimentions.fsz15
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimentions.fsz15
                  ),
                  indicator: CircleTabIndicator(color: Colors.amber, radius: Dimentions.r4),
                  tabs: [
                    Tab(text: tr(context)!.week),
                    Tab(text: tr(context)!.story),
                    Tab(text: tr(context)!.following),
                    Tab(text: tr(context)!.video),
                  ],
                )
              ],
            ),
            actions: [
              SizedBox(
                width: Dimentions.width50,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.mainVideoPlayerController.value.isPlaying) {
                        controller.mainVideoPlayerController.pause();
                      }
                      Navigator.push(context, PageRoutes2(child: const ResearchScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimentions.height2
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                        size: Dimentions.size22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: Dimentions.width50,
          ),
          backgroundColor: Colors.transparent,
          body: TabBarView(
            controller: tabController,
            children: const [
              OfTheWeekScreen(),
              StoryScreen(),
              FollowingScreen(),
              VideoScreen(),
            ],
          ),
          extendBodyBehindAppBar: true,
        );
      }
    );
  }
}


class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter {

  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late  Paint paint;
    paint = Paint()..color = color;
    paint = paint ..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}