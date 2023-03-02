import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/screens/following_screen.dart';
import 'package:chalenger/views/screens/story_screen.dart';
import 'package:chalenger/views/screens/of_the_week_sreen.dart';
import 'package:chalenger/views/screens/research_screen.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_screen.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chalenger/utils/routes.dart';


bool autoScroll = false;

class MainChallengeScrollPage extends StatefulWidget {
  const MainChallengeScrollPage({super.key});

  @override
  State<MainChallengeScrollPage> createState() => _MainChallengeScrollPageState();
}

class _MainChallengeScrollPageState extends State<MainChallengeScrollPage> 
  with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController tabController = 
    TabController(initialIndex: 3, length: 4, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        title: Padding(
          padding: EdgeInsets.only(right: Dimentions.width5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch.adaptive(
                  value: autoScroll,
                  onChanged: (onChanged) => setState(() {
                    autoScroll = onChanged;
                  }),
                  thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Icon(
                        FontAwesomeIcons.circleChevronUp,
                        color: Colors.black,
                        size: Dimentions.size16,
                      );
                    }
                    return Icon(
                      FontAwesomeIcons.circleChevronUp,
                      color: Colors.black,
                      size: Dimentions.size16,
                    ); 
                  }),
                  activeColor: Colors.amber[300],
                  inactiveThumbColor: Colors.white.withOpacity(0.8),
                  activeTrackColor: Colors.amber[200],
                  inactiveTrackColor: Colors.white.withOpacity(0.6),
                ),
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: Dimentions.width10, right: Dimentions.width10),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimentions.fsz16
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimentions.fsz16
                  ),
                  indicator: CircleTabIndicator(color: Colors.white, radius: Dimentions.r4),
                  tabs: [
                    Tab(text: tr(context)!.week),
                    Tab(text: tr(context)!.story),
                    Tab(text: tr(context)!.following),
                    Tab(text: tr(context)!.video),
                  ],
                ),
                SizedBox(width: Dimentions.width10),
                GestureDetector(
                  onTap: () {
                    if (mainVideoPlayerController.value.isPlaying) {
                      mainVideoPlayerController.pause();
                    }
                    Navigator.push(context, PageRoutes2(child: const ResearchScreen()));
                  },
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                    size: Dimentions.size22,
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
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