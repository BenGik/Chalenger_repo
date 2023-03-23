import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/writting_comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.65,
        maxChildSize: 0.8,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimentions.r20)
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimentions.height10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimentions.width15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 1),
                      Row(
                        children: [
                          Text(
                            "1200",
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: Dimentions.fsz14,
                              )
                            )
                          ),
                          SizedBox(width: Dimentions.width5),
                          Text(
                            tr(context)!.comments,
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: Dimentions.fsz14,
                              )
                            )
                          ),
                        ],
                      ),
                      // SizedBox(width: Dimentions.width50*2 + Dimentions.width10),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: FaIcon(
                          FontAwesomeIcons.xmark,
                          color: Colors.black,
                          size: Dimentions.size20
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimentions.height10),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black45,
                        width: 0.5
                      )
                    )
                  ),
                  width: double.infinity,
                  height: Dimentions.height800/2+Dimentions.height50,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimentions.width10,
                  ),
                  child: ListView.builder(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimentions.width10,
                          vertical: Dimentions.height10
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: Dimentions.r20,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              backgroundImage: const AssetImage('assets/images/i_3.jpg'),
                            ),
                            SizedBox(width: Dimentions.width10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("username",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w800,
                                        fontSize: Dimentions.fsz15,
                                      ),
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: Dimentions.height2),
                                  Text(userComment,
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimentions.fsz16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimentions.height2*2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("46 min",
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w600,
                                                fontSize: Dimentions.fsz16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: Dimentions.width10),
                                          Text("Répondre",
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700,
                                                fontSize: Dimentions.fsz15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("20",
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w700,
                                                fontSize: Dimentions.fsz14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: Dimentions.width2),
                                          FaIcon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.black45,
                                            size: Dimentions.size24,
                                          ),
                                          SizedBox(width: Dimentions.width15*2),
                                          Text("20",
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w700,
                                                fontSize: Dimentions.fsz14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: Dimentions.width2),
                                          FaIcon(
                                            FontAwesomeIcons.heartCrack,
                                            color: Colors.black45,
                                            size: Dimentions.size24,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                ),
                Visibility(
                  visible: true,
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
                                padding: EdgeInsets.only(
                                  top: Dimentions.height10,
                                  bottom: Dimentions.height10,
                                  left: Dimentions.width20,
                                  right: Dimentions.width20
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => showModalBottomSheet(
                                        barrierColor: Colors.transparent,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => const WrittingCommentBottomSheet()
                                      ),
                                      child: Text(
                                        tr(context)!.add_comment,
                                        style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Dimentions.fsz15,
                                        ),
                                      ),
                                      )
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => showModalBottomSheet(
                                            barrierColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) => const WrittingCommentBottomSheet()
                                          ),
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
                                          onTap: () => showModalBottomSheet(
                                            barrierColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) => const WrittingCommentBottomSheet()
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.faceSmile,
                                            color: Colors.black,
                                            size: Dimentions.size24,
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
              ]
            )
          )
        )
      )
    );
  }
  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child)
  );
}