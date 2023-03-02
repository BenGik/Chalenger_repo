import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final commentTextController = TextEditingController();
String userComment = "user comment";

class WrittingCommentBottomSheet extends StatefulWidget {
  const WrittingCommentBottomSheet({super.key});

  @override
  State<WrittingCommentBottomSheet> createState() => _WrittingCommentBottomSheetState();
}

class _WrittingCommentBottomSheetState extends State<WrittingCommentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool showComment = MediaQuery.of(context).viewInsets.bottom != 0;
    return makeDismissible(
      child: Padding(
        padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: showComment == true ? 0.18 : 0.12,
          maxChildSize: showComment == true ?  0.18 : 0.12,
          minChildSize: 0.1,
          builder: (_, controller) => Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimentions.width20
                  ),
                  width: double.infinity,
                  height: Dimentions.height50-Dimentions.height5,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(height: Dimentions.height5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimentions.width10
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: Dimentions.r20,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        backgroundImage: const AssetImage('assets/images/i_3.jpg'),
                      ),
                      SizedBox(width: Dimentions.width10),
                      Container(
                        width: Dimentions.width150*2+Dimentions.width40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(Dimentions.r25)
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
                                  controller: commentTextController,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimentions.fsz15,
                                      decoration: TextDecoration.none
                                    ),
                                  ),
                                  cursorHeight: Dimentions.height25,
                                  textAlignVertical: TextAlignVertical.center,
                                  autofocus: true,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    hintText: tr(context)!.add_comment,
                                    hintStyle: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.black,
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
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("@",
                                      style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: Dimentions.fsz12*2,
                                        ),
                                      )
                                    ),
                                  ),
                                  SizedBox(width: Dimentions.width15),
                                  GestureDetector(
                                    onTap: () {},
                                    child: FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.black,
                                      size: Dimentions.size24,
                                    ),
                                  ),
                                  SizedBox(width: Dimentions.width15),
                                  Visibility(
                                    visible: true,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          userComment = commentTextController.text;
                                          commentTextController.clear();
                                        });
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.solidCircleUp,
                                        color: Colors.amber,
                                        size: Dimentions.size24,
                                      ),
                                    ),
                                  )
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child)
  );
}