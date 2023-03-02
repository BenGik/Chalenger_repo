import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';


class OfTheWeekScreen extends StatefulWidget {
  const OfTheWeekScreen({super.key});

  @override
  State<OfTheWeekScreen> createState() => _OfTheWeekScreenState();
}

class _OfTheWeekScreenState extends State<OfTheWeekScreen> {
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