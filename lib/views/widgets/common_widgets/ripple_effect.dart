import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RippleEffect extends StatelessWidget {
  final Widget? child;
  final Color fcolor;
  final Color scolor;
  final void Function()? onTap;
  const RippleEffect({
    super.key,
    this.fcolor = Colors.grey,
    this.scolor = Colors.blueGrey,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      highlightColor: fcolor,
      splashColor: scolor,
      child: child,
    );
  }
}