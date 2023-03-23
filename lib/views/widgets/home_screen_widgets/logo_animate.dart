import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class LogoAnimate extends StatefulWidget {
  const LogoAnimate({super.key});

  @override
  State<LogoAnimate> createState() => _LogoAnimateState();
}

class _LogoAnimateState extends State<LogoAnimate>
with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 20000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: Dimentions.width40,
        width: Dimentions.width40,
        padding: EdgeInsets.all(Dimentions.width5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.width20),
          border: Border.all(color: Colors.white54),
          color: Color(0xFF010212)
        ),
        child: CircleAvatar(
          backgroundColor: Color(0xFF010212),
          backgroundImage: const AssetImage('assets/icons/ic_2.png'),
        ),
      ),
    );
  }
}