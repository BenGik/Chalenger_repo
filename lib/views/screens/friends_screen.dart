import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF010212),
    );
  }
}