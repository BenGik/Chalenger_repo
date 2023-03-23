import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class StoryViewPage extends StatelessWidget {
  const StoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010212),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: Dimentions.width20,
              backgroundColor: Colors.grey.withOpacity(0.2),
              backgroundImage: const AssetImage("assets/images/i_1.jpg"),
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
        actions: [
          GestureDetector(
            child: SizedBox(
              width: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FaIcon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white, 
                  size: Dimentions.size22,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/i_1.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimentions.height20*2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  height: 1,
                  width: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: Dimentions.height50,
                    horizontal: Dimentions.width10
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
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimentions.height5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(
                  FontAwesomeIcons.angleUp,
                  color: Colors.amber.shade300, 
                  size: Dimentions.size20,
                ),
                Center(
                  child: Text(
                    "Commenter",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.amber.shade300,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16,
                      ),
                    )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}