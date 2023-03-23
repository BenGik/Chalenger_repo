import 'package:chalenger/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileLabelCountWidget extends StatelessWidget {
  const ProfileLabelCountWidget({
    super.key,
    required this.labelCount,
    required this.labelText
  });
  final String labelText;
  final String labelCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelCount,
          style: GoogleFonts.mulish(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: Dimentions.fsz16,
            ),
          ),
        ),
        Text(
          labelText,
          style: GoogleFonts.mulish(
            textStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontWeight: FontWeight.w600,
              fontSize: Dimentions.fsz14,
            ),
          ),
        ),
      ],
    );
  }
}