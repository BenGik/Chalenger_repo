import 'package:flutter/material.dart';


class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final Color color;
  const CustomScrollbar({
    super.key,
    required this.child,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(color)
        )
      ),
      child: Scrollbar(
        child: child
      ),
    );
  }
}