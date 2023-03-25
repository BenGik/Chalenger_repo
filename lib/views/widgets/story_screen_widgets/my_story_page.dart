import 'dart:io';

import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/widgets/common_widgets/custom_over_scroll_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class MyStoryPage extends StatelessWidget {
  const MyStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010212),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        title: Text(
          "Ma story",
          style: GoogleFonts.mulish(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: Dimentions.fsz14*2 - Dimentions.fsz10,
            ),
          )
        ),
        centerTitle: Platform.isAndroid
        ? false
        : true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: Dimentions.height50*2,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width20,
              ),
              child: CustomOverScrollNotification(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimentions.height10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: Dimentions.width50/2,
                                      backgroundColor: Colors.grey.withOpacity(0.2),
                                      backgroundImage: const AssetImage("assets/images/i_1.jpg"),
                                    ),
                                    SizedBox(width: Dimentions.width10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "0 vue",
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: Dimentions.fsz16,
                                            ),
                                          )
                                        ),
                                        Text(
                                          "A l'instant",
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
                                FaIcon(
                                  FontAwesomeIcons.ellipsisVertical,
                                  color: Colors.white, 
                                  size: Dimentions.size22,
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Dimentions.height50*4,
                          top: Dimentions.height20
                        ),
                        child: Column(
                          children: [
                            const Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: Dimentions.height5),
                            Center(
                              child: Text(
                                "Vos mis à jour de story disparaîtront après 24 heures.",
                                style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800,
                                    fontSize: Dimentions.fsz12,
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
          Positioned(
            bottom: Dimentions.height20,
            right:  Dimentions.width15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "btn3",
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
                  heroTag: "btn4",
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