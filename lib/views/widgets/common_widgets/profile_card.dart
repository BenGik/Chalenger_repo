import 'package:flutter/material.dart';


class ProfileCard extends StatelessWidget {
  final double? radius;
  final double? iconRadius;
  final double iconTopPading;
  final double iconLeftPading;
  final String image;
  final Widget icon;
  final Color iconBackColor;
  final Color iconBorderColor;
  final void Function()? action;
  const ProfileCard({
    super.key,
    required this.image,
    required this.icon,
    required this.iconBackColor,
    required this.iconBorderColor,
    required this.radius,
    required this.iconRadius,
    required this.iconTopPading,
    this.iconLeftPading = 0,
    this.action
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 5,
            bottom: 2
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey.withOpacity(0.2),
            backgroundImage: AssetImage(image),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: iconTopPading,
            left: iconLeftPading
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: iconBorderColor,
              shape: BoxShape.circle
            ),
            child: CircleAvatar(
              backgroundColor: iconBackColor,
              radius: iconRadius,
              child: Center(
                child: GestureDetector(
                  onTap: action,
                  child: icon
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}