import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';


class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010212),
      body: Stack(
        children: 
          [
            Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimentions.width50))
            ),
          ),
        ],
      ),
    );
  }
}