import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/common_widgets/profile_card.dart';
import 'package:chalenger/views/widgets/profiles_widgets/user_items.dart';
import 'package:chalenger/views/widgets/profiles_widgets/user_settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chalenger/views/widgets/profiles_widgets/profile_label_count.dart';
import '../widgets/profiles_widgets/persistent_header.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;},
          child: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                const  CustumProfileAppBar(),
                const SliverToBoxAdapter(
                  child: ProfileHeader()
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: PersistentHeader(
                    minHeight: Dimentions.height35,
                    maxHeight: Dimentions.height35,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.blueGrey,
                      tabs: [
                        Tab(
                          icon: FaIcon(
                          FontAwesomeIcons.chartColumn,
                          size: Dimentions.size20,
                          ),
                        ),
                        Tab(icon: FaIcon(
                            FontAwesomeIcons.heart,
                            size: Dimentions.size20,
                          ),
                        )
                      ]
                    )
                  )
                )
              ];
            },
            body: const TabBarView(
              children: [
                UserPublictionsView(),
                UserLikesView()
              ],
            ),
          ),
        )
      ),
    );
  }
}

class CustumProfileAppBar extends StatelessWidget {
  const CustumProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: 50,
      leading: SizedBox(width: Dimentions.width10),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(Dimentions.width2),
              child: Text(tr(context)!.choose_nickname,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimentions.fsz15,
                  ),
                ),
              )
            ),
          ),
          SizedBox(width: Dimentions.width5),
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.angleDown,
              color: Colors.black,
              size: Dimentions.size16
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: Dimentions.width50,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimentions.height5
                      ),
                      width: Dimentions.width20,
                      child: FaIcon(
                        FontAwesomeIcons.solidTrashCan,
                        color: Colors.blueGrey,
                        size: Dimentions.size16
                      ),
                    ),
                  ),
                SizedBox(width: Dimentions.width10),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    barrierColor: Colors.black.withOpacity(0.4),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const UserSettingsBottomSheet()
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimentions.height5
                    ),
                    width: Dimentions.width10,
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                      color: Colors.black,
                      size: Dimentions.size24
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool isExpansionTileOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
            bottom: 10,
            right: 30
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileCard(
                radius: Dimentions.width50,
                iconRadius: Dimentions.width5*5/2,
                iconTopPading: Dimentions.width20*3,
                image: "assets/images/i_3.jpg",
                icon: FaIcon(
                  FontAwesomeIcons.rotate,
                  color: Colors.white, 
                  size: Dimentions.size14,
                ),
                iconBackColor: Colors.amber.shade400,
                iconBorderColor: Colors.white
              ),
              ProfileLabelCountWidget(
                labelCount: '45',
                labelText: tr(context)!.following
              ),
              ProfileLabelCountWidget(
                labelCount: '100',
                labelText: tr(context)!.followers
              ),
              ProfileLabelCountWidget(
                labelCount: '125',
                labelText: tr(context)!.likes
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "@username",
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(width: Dimentions.width5),
                  FaIcon(
                    FontAwesomeIcons.qrcode,
                    color: Colors.blueGrey, 
                    size: Dimentions.size14,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Stackedlist",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: Dimentions.fsz16,
                    ),
                  ),
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2
                  ),
                  child: Text(
                    "[Programming & tutorials]",
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz15,
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: Dimentions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Dimentions.r5)
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimentions.height10,
                horizontal: Dimentions.width15
              ),
              child: Text(tr(context)!.profile_modifier,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimentions.fsz15,
                  ),
                ),
              ),
            ),
              SizedBox(width: Dimentions.width5),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimentions.height10,
                horizontal: Dimentions.width15
              ),
              child: Text(tr(context)!.add_friends,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimentions.fsz15,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimentions.fsz10),
        ExpansionTile(
          onExpansionChanged: (isOpen) => {
            setState(() {
              isExpansionTileOpen = isOpen;
            })
          },
          trailing: isExpansionTileOpen
          ? FaIcon(
            FontAwesomeIcons.angleUp,
            color: Colors.amber[300],
            size: Dimentions.size20
          )
          :FaIcon(
            FontAwesomeIcons.angleDown,
            color: Colors.grey.withOpacity(0.6),
            size: Dimentions.size20
          ),
          title: Padding(
            padding: EdgeInsets.only(
              left: Dimentions.width50
            ),
            child: Center(
              child: Text(
                "Socials",
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimentions.fsz16,
                  ),
                ),
              ),
            ),
          ),
          subtitle:  isExpansionTileOpen
          ? Padding(
            padding: EdgeInsets.only(
              left: Dimentions.width50
            ),
            child: Center(
              child: Text(
                "Visit user's other socials",
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w800,
                    fontSize: Dimentions.fsz15,
                  ),
                ),
              ),
            ),
          )
          : null,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Dimentions.width40,
                  height: Dimentions.width40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(Dimentions.width20)
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.white,
                      size: Dimentions.size24
                    ),
                  )
                ),
                SizedBox(width: Dimentions.width15),
                Container(
                  width: Dimentions.width40,
                  height: Dimentions.width40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(Dimentions.width20)
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.link,
                      color: Colors.white,
                      size: Dimentions.size20
                    ),
                  )
                ),
                SizedBox(width: Dimentions.width15),
                Container(
                  width: Dimentions.width40,
                  height: Dimentions.width40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(Dimentions.width20)
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Colors.white,
                      size: Dimentions.size24
                    ),
                  )
                )
              ],
            )
          ],
        ),
        Divider(
          height: 1,
          color: isExpansionTileOpen
          ? Colors.transparent
          :Colors.grey.withOpacity(0.6),
        )
      ],
    );
  }
}