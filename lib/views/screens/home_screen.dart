import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/screens/add_content_screen.dart';
import 'package:chalenger/views/screens/friends_screen.dart';
import 'package:chalenger/views/screens/main_challenge_scroll_page.dart';
import 'package:chalenger/views/screens/notifications_screen.dart';
import 'package:chalenger/views/screens/profile_managing_screen.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final tabs =[
    const MainChallengeScrollPage(),
    const FriendsScreen(),
    const AddContentSreen(),
    const NotificationsScreen(),
    const ProfileManagingScreen()
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
      backgroundColor: const Color(0xFF010212),
      extendBody: true,
      body: tabs[_selectedIndex],
      bottomNavigationBar: Visibility(
        visible: _selectedIndex == 2? false : true,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const RiveAnimation.asset(
                "assets/riv_icons/homeicon.riv",
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
                width: 32,
                height: 32,
                child: RiveAnimation.asset(
                  _selectedIndex<=2 ? "assets/riv_icons/addbuttonlight.riv"
                  : "assets/riv_icons/addbuttondark.riv",
                ),
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.bell),
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
          backgroundColor: _selectedIndex <=2? const Color(0xFF010212) : Colors.white,
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