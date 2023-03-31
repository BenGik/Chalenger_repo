import 'dart:math';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/routes.dart';
import 'package:chalenger/views/widgets/story_screen_widgets/my_story_page.dart';
import 'package:chalenger/views/widgets/common_widgets/build_dashed_border.dart';
import 'package:chalenger/views/widgets/common_widgets/custom_over_scroll_notification.dart';
import 'package:chalenger/views/widgets/common_widgets/profile_card.dart';
import 'package:chalenger/views/widgets/common_widgets/scrollbar.dart';
import 'package:chalenger/views/widgets/story_screen_widgets/story_view_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010212),
      body: Stack(
        children: [
          Positioned(
            top: Dimentions.height50*2,
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomScrollbar(
              color: Colors.blueGrey,
              child: CustomOverScrollNotification(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimentions.width15
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Dimentions.height10),
                        GestureDetector(
                          onTap:() => Navigator.push(context, PageRoutes3(child: const MyStoryPage())),
                          child: Row(
                            children: [
                              ProfileCard(
                                image: "assets/images/i_1.jpg",
                                icon: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white, 
                                  size: Dimentions.size14,
                                ),
                                iconBackColor: Colors.amber.shade400,
                                iconBorderColor: Color(0xFF010212),
                                radius: Dimentions.width50/2,
                                iconRadius: Dimentions.width10,
                                iconTopPading: Dimentions.height20,
                              ),
                              SizedBox(width: Dimentions.width10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ma story",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: Dimentions.fsz16,
                                      ),
                                    )
                                  ),
                                  Text(
                                    "Appuyez pour ajouter une nouvelles story",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimentions.fsz14,
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: Dimentions.height15),
                        Text(
                          "Mises à jour récentes",
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                              fontSize: Dimentions.fsz15,
                            ),
                          )
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimentions.height10
                              ),
                              child: GestureDetector(
                                onTap:() => Navigator.push(context, PageRoutes3(child: const StoryViewPage())),
                                child: Row(
                                  children: [
                                    BuildDashedBorder(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.amber.shade300,
                                      partition: [(((2*pi*(3+Dimentions.width50/2))-5*10)/10), 5],
                                      child: CircleAvatar(
                                        radius: Dimentions.width50/2,
                                        backgroundColor: Colors.grey.withOpacity(0.2),
                                        backgroundImage: const AssetImage("assets/images/i_1.jpg"),
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
                                              fontWeight: FontWeight.w800,
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                        Text(
                          "Mises à jour vues",
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                              fontSize: Dimentions.fsz15,
                            ),
                          )
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimentions.height10
                              ),
                              child: GestureDetector(
                                onTap:() => Navigator.push(context, PageRoutes3(child: const StoryViewPage())),
                                child: Row(
                                  children: [
                                    BuildDashedBorder(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.blueGrey,
                                      partition: [(((2*pi*(3+Dimentions.width50/2))-8*2)/2), 8],
                                      child: CircleAvatar(
                                        radius: Dimentions.width50/2,
                                        backgroundColor: Colors.grey.withOpacity(0.2),
                                        backgroundImage: const AssetImage("assets/images/i_1.jpg"),
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: Dimentions.height50*4
                          ),
                          child: Column(
                            children: [
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(height: Dimentions.height5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   FaIcon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.grey, 
                                    size: Dimentions.size14,
                                  ),
                                  Text(
                                    "  Vos mises à jours de Story sont",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w800,
                                        fontSize: Dimentions.fsz12,
                                      ),
                                    )
                                  ),
                                  Text(
                                    " chiffrées de bout en bout.",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.amber.shade300,
                                        fontWeight: FontWeight.w800,
                                        fontSize: Dimentions.fsz12,
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ),
          Positioned(
            bottom: Dimentions.height20*3,
            right:  Dimentions.width15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  mini: true,
                  onPressed: () {},
                  backgroundColor: Colors.blueGrey,
                  child: FaIcon(
                    FontAwesomeIcons.pen,
                    color: Colors.white, 
                    size: Dimentions.size22,
                  ),
                ),
                SizedBox(height: Dimentions.height10),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {},
                  backgroundColor: Colors.amber.shade400,
                  child: FaIcon(
                    FontAwesomeIcons.camera,
                    color: Colors.white, 
                    size: Dimentions.size24,
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}