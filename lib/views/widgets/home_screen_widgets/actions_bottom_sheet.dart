import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


bool clearMode = false;

class ActionsBottomSheet extends StatefulWidget {
  const ActionsBottomSheet({super.key});

  @override
  State<ActionsBottomSheet> createState() => _ActionsBottomSheetState();
}

class _ActionsBottomSheetState extends State<ActionsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.5,
        builder: (_, contoller) => Container(
          decoration: BoxDecoration(
            color: Color(0xFFECF6F2),
            borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimentions.r20)
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimentions.height20,
              horizontal: Dimentions.width10
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimentions.width50,
                          height: Dimentions.width50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimentions.width50/2)
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidFlag,
                              color: Colors.blueGrey,
                              size: Dimentions.size24
                            ),
                          )
                        ),
                        SizedBox(height: Dimentions.height10),
                        Text(
                          tr(context)!.report,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimentions.fsz12,
                            )
                          )
                        )
                      ],
                    ),
                    SizedBox(width: Dimentions.width20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimentions.width50,
                          height: Dimentions.width50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimentions.width50/2)
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.heartCrack,
                              color: Colors.blueGrey,
                              size: Dimentions.size24
                            ),
                          )
                        ),
                        SizedBox(height: Dimentions.height10),
                        Text(
                          tr(context)!.not_cool,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimentions.fsz12,
                            )
                          )
                        )
                      ],
                    ),
                    SizedBox(width: Dimentions.width20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimentions.width50,
                          height: Dimentions.width50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimentions.width50/2)
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.download,
                              color: Colors.blueGrey,
                              size: Dimentions.size24
                            ),
                          )
                        ),
                        SizedBox(height: Dimentions.height10),
                        Text(
                          tr(context)!.download,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimentions.fsz12,
                            )
                          )
                        )
                      ],
                    ),
                    SizedBox(width: Dimentions.width20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimentions.width50,
                          height: Dimentions.width50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimentions.width50/2)
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.blueGrey,
                              size: Dimentions.size24
                            ),
                          )
                        ),
                        SizedBox(height: Dimentions.height10),
                        Text(
                          tr(context)!.favorite,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimentions.fsz12,
                            )
                          )
                        )
                      ],
                    ),
                    SizedBox(width: Dimentions.width20),
                    Column(
                      children: [
                        SizedBox(
                          width: Dimentions.width50,
                          height: Dimentions.width50,
                          child: Switch.adaptive(
                            value: clearMode,
                            onChanged: (onChanged) => setState(() {
                              clearMode = onChanged;
                            }),
                            thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Icon(
                                  FontAwesomeIcons.solidSun,
                                  color: Colors.black,
                                  size: Dimentions.size16,
                                );
                              }
                              return Icon(
                                FontAwesomeIcons.solidMoon,
                                color: Colors.black,
                                size: Dimentions.size16,
                              ); 
                            }),
                            activeColor: Colors.amber[300],
                            inactiveThumbColor: Colors.grey.withOpacity(0.8),
                            activeTrackColor: Colors.amber[200],
                            inactiveTrackColor: Colors.grey.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: Dimentions.height10),
                        Text(
                          tr(context)!.clear_mode,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimentions.fsz12,
                            )
                          )
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Dimentions.height10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimentions.r20/2)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimentions.width10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr(context)!.share,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: Dimentions.fsz16,
                            )
                          )
                        ),
                        Row(
                          children: [
                            Container(
                              width: Dimentions.width40,
                              height: Dimentions.width40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(Dimentions.width40/2)
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.white,
                                  size: Dimentions.size24
                                ),
                              )
                            ),
                            SizedBox(width: Dimentions.width10),
                            Container(
                              width: Dimentions.width40,
                              height: Dimentions.width40,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(Dimentions.width40/2)
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.link,
                                  color: Colors.white,
                                  size: Dimentions.size20
                                ),
                              )
                            ),
                            SizedBox(width: Dimentions.width10),
                            Container(
                              width: Dimentions.width40,
                              height: Dimentions.width40,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(Dimentions.width40/2)
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  color: Colors.white,
                                  size: Dimentions.size24
                                ),
                              )
                            ),
                            SizedBox(width: Dimentions.width10),
                            FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: Colors.black,
                              size: Dimentions.size20
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimentions.height10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimentions.r20/2)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimentions.width10,
                      vertical: Dimentions.height25
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimentions.r20,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: const AssetImage('assets/images/i_2.jpg'),
                                ),
                                SizedBox(width: Dimentions.width10),
                                Text(
                                  "@totorino",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimentions.fsz16,
                                    )
                                  )
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  tr(context)!.creator_page,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimentions.fsz14,
                                    )
                                  )
                                ),
                                SizedBox(width: Dimentions.width10),
                                FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.black,
                                  size: Dimentions.size20
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: Dimentions.height20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimentions.r20,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: const AssetImage('assets/images/i_3.jpg'),
                                ),
                                SizedBox(width: Dimentions.width10),
                                Text(
                                  "Ebénézer Guenou",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimentions.fsz16,
                                    )
                                  )
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(Dimentions.r5)
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimentions.width20,
                                  vertical: Dimentions.height10
                                ),
                                child: Text(
                                  "Challenge",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimentions.fsz16,
                                    )
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: Dimentions.height20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: Dimentions.width40,
                                  height: Dimentions.height40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(Dimentions.r20),
                                    border: Border.all(
                                      color: Colors.black45,
                                      width: 1
                                    )
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      color: Colors.black,
                                      size: Dimentions.size22
                                    ),
                                  )
                                ),
                                SizedBox(width: Dimentions.width10),
                                Text(
                                  tr(context)!.add_comment,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimentions.fsz16,
                                    )
                                  )
                                ),
                              ],
                            ),
                            FaIcon(
                              FontAwesomeIcons.angleRight,
                              color: Colors.blueGrey,
                              size: Dimentions.size20
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
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