import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class PicturesPreviewPage extends StatefulWidget {
  const PicturesPreviewPage({
    super.key,
    required this.file
  });
   final XFile file;

  @override
  State<PicturesPreviewPage> createState() => _PicturesPreviewPageState();
}

class _PicturesPreviewPageState extends State<PicturesPreviewPage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    File picture = File(widget.file.path);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF010212),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
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
            SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              width: double.infinity,
              child: Image.file(
                picture,
                fit: BoxFit.cover,
              )
            ),
            AnimatedPadding(
              curve: Curves.ease,
              duration: kThemeAnimationDuration,
              padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom + Dimentions.height10),
              child: Positioned(
                bottom: 10,
                left: 0,
                right: 0,
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
                                      border: const OutlineInputBorder(
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
                          backgroundColor: const Color(0xFF1ECFC3),
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