import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/common_widgets/custom_over_scroll_notification.dart';
import 'package:chalenger/views/widgets/common_widgets/custom_slide_transition.dart';
import 'package:chalenger/views/widgets/profiles_widgets/creator_items.dart';
import 'package:chalenger/views/widgets/common_widgets/profile_card.dart';
import 'package:chalenger/views/widgets/profiles_widgets/profile_label_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/profiles_widgets/persistent_header.dart';


class CreatorProfileScreen extends StatelessWidget {
  const CreatorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: CustomOverScrollNotification(
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
                CreatorPublictionsView(),
                CreatorLikesView()
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
      leadingWidth: Dimentions.width50,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                Navigator.of(context).pop(),
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                size: Dimentions.size22
              ),
            ),
          ],
        ),
      centerTitle: true,
      title: Text(
        "username",
        style: GoogleFonts.mulish(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: Dimentions.fsz16,
          ),
        ),
        maxLines: 1,
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 20,
            child: GestureDetector(
              child: FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.black,
                size: Dimentions.size22
              ),
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
                image: "assets/images/i_4.jpg",
                icon: FaIcon(
                  FontAwesomeIcons.plus,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10
              ),
              child: Text(
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
            ),
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
            )
          ],
        ),
        SizedBox(height: Dimentions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.5),
                borderRadius: BorderRadius.circular(Dimentions.r5)
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimentions.height10,
                horizontal: Dimentions.width50
              ),
              child: Text(
                tr(context)!.follow,
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
                borderRadius: BorderRadius.circular(Dimentions.r5)
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimentions.height10,
                horizontal: Dimentions.width15
              ),
              child: FaIcon(
                FontAwesomeIcons.angleDown,
                color: Colors.black, 
                size: Dimentions.size20,
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
      ],
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1000,
                width: 300,
                color: Colors.red,
              ),
              Container(
                height: 1500,
                width: 300,
                color: Colors.blue,
              )
            ]
          ),
        ),
      ),
    );
  }
}