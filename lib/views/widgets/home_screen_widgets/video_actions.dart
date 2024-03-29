import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/routes.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/app_theme_management_systheme/app_theme_change_screen.dart';
import 'package:chalenger/views/screens/creator_profile_screen.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/writting_comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';


bool autoScroll = false;

class VideoActions extends StatefulWidget {
  const VideoActions({super.key});

  @override
  State<VideoActions> createState() => _VideoActionsState();
}

class _VideoActionsState extends State<VideoActions> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            bottom: Dimentions.height80 + Dimentions.height5,
            left: Dimentions.width10,
            right: Dimentions.width150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: Dimentions.height10/3*2),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, PageRoutes2(child: const CreatorProfileScreen())),
                        child: Container(
                          padding: const EdgeInsets.all(1.5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: CircleAvatar(
                            radius: Dimentions.r20*1.1,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            backgroundImage: const AssetImage('assets/images/i_3.jpg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimentions.width10),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimentions.height2
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Dimentions.width20,
                                width: Dimentions.width20,
                                decoration: BoxDecoration(
                                  color: Colors.amber[400],
                                  borderRadius: BorderRadius.circular(Dimentions.width10),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: Dimentions.size15,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimentions.width5),
                              Text(
                                "@username",
                                style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: Dimentions.fsz16
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimentions.height5),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.eye,
                                color: Colors.white,
                                size: Dimentions.size14,
                              ),
                              SizedBox(width: Dimentions.width5),
                              Text(
                                "12k",
                                style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimentions.fsz14
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimentions.width10),
                              Text(
                                "il y a 2 jours",
                                style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimentions.fsz14
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimentions.height2),
                Text(
                  "is simply dummy text of the printing and typesetting industry. Lorem ",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimentions.fsz14,
                    ),
                  ),
                ),
                SizedBox(height: Dimentions.height5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.music, color: Colors.white, size: Dimentions.size14),
                    SizedBox(width: Dimentions.width10,),
                    Text(
                      "Toto ft katal édjimoulédjomo",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        )
                      )
                    )
                  ],
                )
              ],
            )
          ),
          Positioned(
            right: Dimentions.width10,
            bottom: Dimentions.height80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack(
                //   alignment: AlignmentDirectional.bottomCenter,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(bottom: Dimentions.height10/3*2),
                //       child: GestureDetector(
                //         onTap: () => Navigator.push(context, PageRoutes2(child: const CreatorProfileScreen())),
                //         child: Container(
                //           padding: const EdgeInsets.all(1.5),
                //           decoration: const BoxDecoration(
                //             color: Colors.white,
                //             shape: BoxShape.circle
                //           ),
                //           child: CircleAvatar(
                //             radius: Dimentions.r25,
                //             backgroundColor: Colors.grey.withOpacity(0.2),
                //             backgroundImage: const AssetImage('assets/images/i_3.jpg'),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //         padding: EdgeInsets.symmetric(
                //           horizontal: Dimentions.width10/3*2,
                //           vertical: Dimentions.height5/2
                //         ),
                //         decoration: BoxDecoration(
                //           color: Colors.amber[400],
                //           borderRadius: BorderRadius.circular(Dimentions.r20),
                //         ),
                //         child: FaIcon(
                //           FontAwesomeIcons.plus,
                //           color: Colors.white,
                //           size: Dimentions.size12,
                //         ),
                //     )
                //   ],
                // ),
                SizedBox(height: Dimentions.height20),
                Container(
                  padding: EdgeInsets.only(
                    bottom: Dimentions.height20,
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/ic_2.png", height: Dimentions.height34),
                      SizedBox(height: Dimentions.height5),
                      Text(
                        "1200",
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimentions.fsz12,
                          )
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: Dimentions.height20,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: LikeButton(
                          likeBuilder:(isLiked) {
                            if (isLiked == true) {
                              return FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Color(0xFFAD1457),
                                size: Dimentions.size30
                              );
                            } else{
                              return FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.white,
                                size: Dimentions.size30
                              );
                            }
                          },
                          circleColor: CircleColor(start: Colors.white.withOpacity(0.9), end:  Color(0xFFAD1457)),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Color(0xFFAD1457),
                            dotSecondaryColor: Color(0xFFAD1457),
                            dotThirdColor: Color(0xFFAD1457),
                            dotLastColor: Color(0xFFAD1457)
                          ),
                          // size: Dimentions.size20*2
                        )
                      ),
                      SizedBox(height: Dimentions.height5),
                      Text(
                        "1200",
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimentions.fsz12,
                          )
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: Dimentions.height20,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () { showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => buildCommentSheet()
                        );
                      },
                        child: FaIcon(
                          FontAwesomeIcons.solidCommentDots,
                          color: Colors.white.withOpacity(0.9),
                          size: Dimentions.size30
                        )
                      ),
                      SizedBox(height: Dimentions.height5),
                      Text(
                        "1200",
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimentions.fsz12,
                          )
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: Dimentions.height20,
                  ),
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.share,
                        color: Colors.white.withOpacity(0.9),
                        size: Dimentions.size30
                      ),
                      SizedBox(height: Dimentions.height5),
                      Text(
                        "1200",
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimentions.fsz12,
                          )
                        )
                      )
                    ],
                  ),
                ),
                // Switch.adaptive(
                //   value: autoScroll,
                //   onChanged: (onChanged) => setState(() {
                //     autoScroll = onChanged;
                //   }),
                //   thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
                //     if (states.contains(MaterialState.selected)) {
                //       return Icon(
                //         FontAwesomeIcons.circleChevronUp,
                //         color: Colors.black,
                //         size: Dimentions.size16,
                //       );
                //     }
                //     return Icon(
                //       FontAwesomeIcons.circleChevronUp,
                //       color: Colors.black,
                //       size: Dimentions.size16,
                //     ); 
                //   }),
                //   activeColor: Colors.amber[300],
                //   inactiveThumbColor: Colors.white.withOpacity(0.8),
                //   activeTrackColor: Colors.amber[200],
                //   inactiveTrackColor: Colors.white.withOpacity(0.6),
                // ),
                GestureDetector(
                  onTap:() => Navigator.push(context, PageRoutes3(child: const AppThemeChangeScreen())),
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: Dimentions.height20,
                    ),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.palette,
                          color: Colors.white.withOpacity(0.9),
                          size: Dimentions.size30
                        ),
                      ],
                    ),
                  ),
                ),
                // const LogoAnimate()
              ],
            )
          )
        ],
      );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child)
  );

  Widget buildCommentSheet() => makeDismissible(
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
                padding: EdgeInsets.symmetric(horizontal: Dimentions.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(width: Dimentions.width50*2 + Dimentions.width10),
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