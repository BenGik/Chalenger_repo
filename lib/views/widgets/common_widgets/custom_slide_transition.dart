import 'package:flutter/material.dart';


class SlidableLayout extends StatefulWidget {
  final Widget child;
  final VoidCallback onSlided;
  final double actionStartPoint;
  const SlidableLayout({
    super.key,
    required this.child,
    required this.onSlided,
    required this.actionStartPoint
  });

  @override
  State<SlidableLayout> createState() => _SlidableLayoutState();
}

class _SlidableLayoutState extends State<SlidableLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double dragExtend = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2),
      vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: onSlideStart,
      onVerticalDragUpdate: onSlideUpdate,
      onVerticalDragEnd: onSlideEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: AlwaysStoppedAnimation(Offset(0, _controller.value)),
            child: Center(
              child: widget.child
            )
          );
        }
      )
    );
  }

  void onSlideStart (DragStartDetails details) {
    setState(() {
      dragExtend = 0;
      _controller.reset();
    });
  }

  void onSlideUpdate (DragUpdateDetails details) {
    dragExtend += details.primaryDelta!;
    if (dragExtend <= 0) {
      return;
    }
    setState(() {
      _controller.value =  dragExtend.abs() / context.size!.height;
    });
  }

  void onSlideEnd (DragEndDetails details) {
    if (_controller.value > widget.actionStartPoint) {
      widget.onSlided;
    }
    _controller.fling(
      velocity: -1
    );
  }

}