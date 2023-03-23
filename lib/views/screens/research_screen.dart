import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ResearchScreen extends StatefulWidget {
  const ResearchScreen({super.key});

  @override
  State<ResearchScreen> createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  @override
  Widget build(BuildContext context) {
    MainVideoController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
        ),
        leadingWidth: Dimentions.width40,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainVideoController>(
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.mainVideoPlayerController.play();
                    setState(() {
                      controller.mainVideoPlayerController.value.isPlaying;
                    });
                  },
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: Dimentions.size22
                  ),
                );
              }
            ),
          ]
        ),
        title: Row(
          children: [
            Container(
              width: Dimentions.width310,
              height: Dimentions.height40,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        cursorHeight: Dimentions.height25,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                        autofocus: false,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: tr(context)!.research,
                          hintStyle: const TextStyle(
                            color: Colors.white
                          ),
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Dimentions.width10
                          ),
                          border: OutlineInputBorder(
                          borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: Dimentions.width20),
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: Dimentions.size20,
              color: Colors.amber,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white
      ),
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(height: Dimentions.height20),
            SizedBox(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: Dimentions.height10),
                        padding: EdgeInsets.symmetric(horizontal: Dimentions.width10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Colors.black54,
                                  size: Dimentions.size15,
                                ),
                                SizedBox(width: Dimentions.width15),
                                Text("afi va au marigot de pepete",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimentions.fsz15,
                                    ),
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.trash,
                                color: Colors.black45,
                                size: Dimentions.size12,
                              ),
                            ), 
                          ],
                        ),
                      );
                    }
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(right: Dimentions.width10, bottom: Dimentions.height10),
                      child: Text(
                        tr(context)!.clean,
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimentions.fsz16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}