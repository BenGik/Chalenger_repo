import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/screens/add_content_screen.dart';
import 'package:chalenger/views/screens/friends_screen.dart';
import 'package:chalenger/views/screens/main_videos_swipe_page.dart';
import 'package:chalenger/views/screens/notifications_screen.dart';
import 'package:chalenger/views/screens/user_profile_screen.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int notifCount = 8;

  final tabs =[
    const MainVideosSwipePage(),
    const FriendsScreen(),
    const AddContentSreen(),
    const NotificationsScreen(),
    const UserProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF010212),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: tabs[_selectedIndex],
      bottomNavigationBar: Visibility(
        visible: _selectedIndex == 2? false : true,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const SizedBox(
                width: 25,
                height: 25,
                child: RiveAnimation.asset(
                  "assets/riv_icons/homeicon.riv",
                ),
              ),
              activeIcon: const FaIcon(FontAwesomeIcons.house),
              label: tr(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.userGroup),
              activeIcon: const FaIcon(FontAwesomeIcons.userGroup),
              label: tr(context)!.friends,
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: Dimentions.height2*16,
                child: RiveAnimation.asset(
                  _selectedIndex<=2 ? "assets/riv_icons/addbuttonlight.riv"
                  : "assets/riv_icons/addbuttondark.riv",
                ),
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                    const FaIcon(FontAwesomeIcons.bell
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      notifCount == 0
                      ? 0
                      : 2
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                    ),
                    child: notifCount == 0
                    ? const SizedBox()
                    : notifCount > 9
                    ? Text(
                      "9+",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz12,
                        )
                      )
                    )
                    : Text(
                      notifCount.toString(),
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz12,
                        )
                      )
                    ),
                  )
                ]
              ),
              activeIcon: const FaIcon(FontAwesomeIcons.solidBell),
              label: tr(context)!.notification,
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.user),
              activeIcon: const FaIcon(FontAwesomeIcons.solidUser),
              label: tr(context)!.profile,
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _selectedIndex <=2? Color(0xFF010212) : Colors.white,
          elevation: 0,
          selectedItemColor: _selectedIndex<=2 ? Colors.white : Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: Dimentions.fsz10
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w400,
            fontSize: Dimentions.fsz10
          ),
          onTap: _onItemTapped,
          iconSize: Dimentions.size20,
        ),
      ),
    );
  }
}