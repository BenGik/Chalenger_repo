import 'dart:math';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/widgets/common_widgets/custom_over_scroll_notification.dart';
import 'package:chalenger/views/widgets/common_widgets/ripple_effect.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


const List<Map<String, dynamic>> media = [
  {
    "image": "assets/images/i_1.jpg",
  },
  {
    "image": "assets/images/i_2.jpg",
  },
  {
    "image": "assets/images/i_3.jpg",
  },
  {
    "image": "assets/images/i_4.jpg",
  },
  {
    "image": "assets/images/i_5.jpg",
  },
  {
    "image": "assets/images/i_6.jpg",
  },
  {
    "image": "assets/images/i_7.jpg",
  }
];
class StoryViewPage extends StatefulWidget {
  const StoryViewPage({super.key});

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage>
  with SingleTickerProviderStateMixin {
    late AnimationController acontroller;
    late Animation<double> animation;
    PageController pageController = PageController(viewportFraction: 1);
    var currentPage = 0.0;
    int itemCount = 7;
    int imageid =  0;
    bool storyIsPaused = false;
    double entityPadding = 0;
    double scaleFactor = 0.8;
    double height = Dimentions.screenHeight;
    double width = Dimentions.screenWidth;

    @override
  void initState() {
    super.initState();
    acontroller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(acontroller)
    ..addListener(() {
      setState(() {
        if (acontroller.isCompleted && imageid < media.length-1 && currentPage.toInt() < itemCount-1) {
          imageid++;
          acontroller.reset();
          acontroller.forward();
        }else if(acontroller.isCompleted && imageid == media.length-1 && currentPage.toInt() < itemCount-1) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease
          );
        }else if(acontroller.isCompleted && imageid == media.length-1 && currentPage.toInt() == itemCount-1) {
          Get.back();
        }
      });
    });
    acontroller.forward();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

    @override
  void dispose() {
    acontroller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010212),
      extendBodyBehindAppBar: true,
      body: CustomOverScrollNotification(
        child: PageView.builder(
          itemCount: itemCount,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          onPageChanged: (value) {
            acontroller.stop();
            acontroller.reset();
            acontroller.forward();
            setState(() {
              imageid = 0;
            });
          },
          itemBuilder: (context, index) {
            return storyPageScaleAnimation(index);
          }
        ),
      ),
    );
  }

  Widget storyPageEntity (BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Center(
            child: SizedBox(
              height: Dimentions.height80*10.5,
              width: double.infinity,
              child: Center(
                child: Image.asset(
                  media[imageid]["image"].toString(),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTapDown: (details) {
              acontroller.stop();
              setState(() {
                storyIsPaused = true;
              });
            },
            onTapUp: (details) => acontroller.forward(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (imageid == 0 && currentPage.toInt() == 0) {
                      acontroller.forward();
                    }else if (imageid == 0 && currentPage.toInt() > 0 && storyIsPaused == false) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease
                      );
                    }else if (storyIsPaused == false) {
                      setState(() {
                        imageid --; 
                        acontroller.reset();
                        acontroller.forward();
                      });
                    }else {
                      acontroller.forward();
                      storyIsPaused = false;
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    width: Dimentions.width20*3,
                    color: Colors.transparent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (imageid == media.length-1 && currentPage.toInt() == itemCount-1) {
                      if (storyIsPaused == false) {
                        Get.back();
                      }else {
                        acontroller.forward();
                      }
                    }else if (imageid == media.length-1 && currentPage.toInt() < itemCount-1 && storyIsPaused == false) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease
                      );
                    }else if (storyIsPaused == false) {
                      setState(() {
                        imageid ++;
                        acontroller.reset();
                        acontroller.forward();
                      });
                    }else {
                      acontroller.forward();
                      storyIsPaused = false;
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    width: Dimentions.width20*18,
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimentions.height20*3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RippleEffect(
                        fcolor: Colors.white.withOpacity(0.2),
                        scolor: Colors.blueGrey.withOpacity(0.4),
                        onTap: () => Get.back(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimentions.width40,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white, 
                                  size: Dimentions.size22,
                                ),
                              ),
                            ),
                            SizedBox(width: Dimentions.width10),
                            CircleAvatar(
                              radius: Dimentions.width2*9,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              backgroundImage: const AssetImage("assets/images/i_1.jpg"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Dimentions.width10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Christian Koffi",
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: Dimentions.fsz16,
                              ),
                            )
                          ),
                          Text(
                            "il y a 39 minutes",
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimentions.fsz14,
                              ),
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: Dimentions.width20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FaIcon(
                          FontAwesomeIcons.ellipsisVertical,
                          color: Colors.white, 
                          size: Dimentions.size22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: Dimentions.height10,
                  bottom: Dimentions.height20*2,
                  left: Dimentions.width10,
                  right: Dimentions.width10
                ),
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Text(
                    "Description du titre le plus populaire de l'année 2023 dans la ville de lomé koa !!!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimentions.fsz15,
                      ),
                    )
                  ),
                )
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: Dimentions.height5,
            top: 50
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 2.5,
                width: double.infinity,
                color: Colors.transparent,
                child: LinearProgressIndicator(
                  value: animation.value,
                  color: Colors.amber.shade400,
                  backgroundColor: Colors.grey.shade400,
                ),
              ),
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.angleUp,
                    color: Colors.amber.shade300, 
                    size: Dimentions.size18,
                  ),
                  Center(
                    child: Text(
                      "Commenter",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.amber.shade300,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz15,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: Dimentions.height50*2,
          right: Dimentions.width10,
          child: FloatingActionButton(
            heroTag: "btn5",
            mini: true,
            onPressed: () {
              if (imageid == media.length-1 && currentPage.toInt() == itemCount-1) {
                Get.back();
              }else if (imageid == media.length-1 && currentPage.toInt() < itemCount-1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease
                );
              }else {
                setState(() {
                  imageid++;
                });
              }
            },
            backgroundColor: Colors.blueGrey,
            child: Text(
              "${media.length-imageid}",
              style: GoogleFonts.mulish(
                textStyle: TextStyle(
                  color: Colors.amber.shade300,
                  fontWeight: FontWeight.w800,
                  fontSize: Dimentions.fsz16,
                ),
              )
            ),
          ),
        ),
      ],
    );
  }

  Widget storyPageSwipeAnimation (int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 0.0;
        if (pageController.position.haveDimensions) {
          value = index - (pageController.page ?? 0);
          value = (value * 0.03).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: storyPageScaleAnimation(index),
          ),
        );
      },
    );
  }

  Widget storyPageScaleAnimation (int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == currentPage.floor()) {
      var currScale = 1 - (currentPage-index)*(1-scaleFactor);
      var currXTrans = width*(1-currScale)/2;
      var currYTrans = height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(currScale, currScale, 1.0)
      ..setTranslationRaw(currXTrans, currYTrans, 0);
    }else if (index == currentPage.floor()+1) {
      var currScale = scaleFactor + (currentPage-index+1)*(1-scaleFactor);
      var currXTrans = width*(1-currScale)/2;
      var currYTrans = height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(currScale, currScale, 1.0)
      ..setTranslationRaw(currXTrans, currYTrans, 0);
    }else if (index == currentPage.floor()-1) {
      var currScale = 1 - (currentPage-index)*(1-scaleFactor);
      var currXTrans = width*(1-currScale)/2;
      var currYTrans = height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(currScale, currScale, 1.0)
      ..setTranslationRaw(currXTrans, currYTrans, 0);
    }else {
      var currScale = 0.8;
      var currXTrans = width*(1-currScale)/2;
      var currYTrans = height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(currXTrans, currYTrans, 1.0);
    }

    return Transform(
      transform: matrix,
      child: storyPageEntity(context),
    );
  }

}