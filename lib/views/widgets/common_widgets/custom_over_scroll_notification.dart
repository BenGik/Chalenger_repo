import 'package:flutter/material.dart';


class CustomOverScrollNotification extends StatelessWidget {
  final Widget child;
  const CustomOverScrollNotification({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return false;
        },
      child: child,
    );
  }
}