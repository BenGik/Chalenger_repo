import 'package:flutter/material.dart';


class PageRoutes extends PageRouteBuilder {
  final Widget child;

  PageRoutes({
    required this.child
  }):super(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child) =>
    ScaleTransition(
      scale: animation,
      child: child
    );
}

class PageRoutes1 extends PageRouteBuilder {
  final Widget child;

  PageRoutes1({
    required this.child
  }):super(
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero
      ).animate(animation),
      child: child
    );
}

class PageRoutes2 extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  PageRoutes2({
    required this.child,
    this.direction = AxisDirection.left
  }):super(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero
      ).animate(animation),
      child: child
    );
}

class PageRoutes3 extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  PageRoutes3({
    required this.child,
    this.direction = AxisDirection.up
  }):super(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0)
      ).animate(animation),
      child: child
    );
}

class PageRoutes4 extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  PageRoutes4({
    required this.child,
    this.direction = AxisDirection.down
  }):super(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero
      ).animate(animation),
      child: child
    );
}