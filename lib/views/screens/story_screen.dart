import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';


class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010212),
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