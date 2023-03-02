import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:chalenger/views/widgets/add_contents_screen_widgets/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileManagingScreen extends StatefulWidget {
  const ProfileManagingScreen({super.key});

  @override
  State<ProfileManagingScreen> createState() => _ProfileManagingScreenState();
}

class _ProfileManagingScreenState extends State<ProfileManagingScreen>
  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController pController = 
    TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            // horizontal: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(width: Dimentions.width70),
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
                  builder: (context) => buildProfilSheet()
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dimentions.height20),
            CircleAvatar(
              radius: Dimentions.r50,
              backgroundColor: Colors.grey.withOpacity(0.2),
              backgroundImage: const AssetImage('assets/images/i_3.jpg'),
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("@ebenezerguenou",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: Dimentions.fsz15,
                    ),
                  ),
                  maxLines: 1,
                ),
                SizedBox(width: Dimentions.width5),
                FaIcon(
                  FontAwesomeIcons.qrcode,
                  color: Colors.blueGrey, 
                  size: Dimentions.size20,
                ),
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("1",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(tr(context)!.following,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("3",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(tr(context)!.followers,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("5",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(tr(context)!.likes,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
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
            SizedBox(height: Dimentions.height15),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width10
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.5)
                  )
                )
              ),
              height: Dimentions.height35,
              width: double.infinity,
              child: TabBar(
                controller: pController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blueGrey,
                tabs: [
                  Tab(icon: FaIcon(
                      FontAwesomeIcons.qrcode,
                      size: Dimentions.size20,
                    ),
                  ),
                  Tab(icon: FaIcon(
                      FontAwesomeIcons.heart,
                      size: Dimentions.size20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: Dimentions.height800,
              child: TabBarView(
                controller: pController,
                children: const [
                  PicturesView(),
                  VideosView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child)
  );

  Widget buildProfilSheet() => makeDismissible(
    child: DraggableScrollableSheet(
      initialChildSize: 0.18 ,
      maxChildSize: 0.18,
      minChildSize: 0.1,
      builder: (_, contoller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimentions.r15)
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimentions.height20,
            horizontal: Dimentions.width20
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.personCircleQuestion,
                    color: Colors.blueGrey,
                    size: Dimentions.size20
                  ),
                  SizedBox(width: Dimentions.size20),
                  Text(
                    tr(context)!.profile_modifier,
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
              SizedBox(height: Dimentions.height20),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.qrcode,
                    color: Colors.blueGrey,
                    size: Dimentions.size24
                  ),
                  SizedBox(width: Dimentions.width20),
                  Text(
                    tr(context)!.invite_with_profile,
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
              SizedBox(height: Dimentions.height20),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.sun,
                    color: Colors.blueGrey,
                    size: Dimentions.size24
                  ),
                  SizedBox(width: Dimentions.width20),
                  Text(
                    tr(context)!.setting,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16
                      )
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}