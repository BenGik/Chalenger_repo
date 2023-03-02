import 'package:chalenger/views/widgets/home_screen_widgets/video_widget.dart';
import 'package:flutter/material.dart';

bool isScrolling = false;
final _pageController =  PageController();
// var _selectedIndex = 0;

const List<Map<String, dynamic>> item = [
  {
    "profil":{
      "username": "Bengeek"
    },
    "video": "assets/videos/v_1.mp4",
    "description": "is simply dummy text of the printing and typesetting industry. Lorem "
  },
  {
    "profil":{
      "username": "Johni"
    },
    "video": "assets/videos/v_2.mp4",
    "description": "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
  }
];


class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: PageView(
        // onPageChanged: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
        // },
        controller: _pageController,
        scrollBehavior: const ScrollBehavior(),
        allowImplicitScrolling: false,
        scrollDirection: Axis.vertical,
        children: item.map((item){
          return Stack(
            children: [
              VideoWidget(video: item["video"]),
              // Center(child: Text("index: $_selectedIndex", style: const TextStyle(color: Colors.red),))
            ]
          );
        }).toList(),
      ),
    );
  }
}