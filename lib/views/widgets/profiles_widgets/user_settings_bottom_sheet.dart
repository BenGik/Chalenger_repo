import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class UserSettingsBottomSheet extends StatefulWidget {
  const UserSettingsBottomSheet({super.key});

  @override
  State<UserSettingsBottomSheet> createState() => _UserSettingsBottomSheetState();
}

class _UserSettingsBottomSheetState extends State<UserSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return makeDismissible(
    child: DraggableScrollableSheet(
      initialChildSize: 0.18 ,
      maxChildSize: 0.18,
      minChildSize: 0.1,
      builder: (_, contoller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimentions.r15)
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimentions.height20,
            horizontal: Dimentions.width20
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.personCircleQuestion,
                    color: Colors.blueGrey,
                    size: Dimentions.size20
                  ),
                  SizedBox(width: Dimentions.size20),
                  Text(
                    tr(context)!.profile_modifier,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16,
                      )
                    )
                  ),
                ],
              ),
              SizedBox(height: Dimentions.height20),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.qrcode,
                    color: Colors.blueGrey,
                    size: Dimentions.size24
                  ),
                  SizedBox(width: Dimentions.width20),
                  Text(
                    tr(context)!.invite_with_profile,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16,
                      )
                    )
                  ),
                ],
              ),
              SizedBox(height: Dimentions.height20),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.sun,
                    color: Colors.blueGrey,
                    size: Dimentions.size24
                  ),
                  SizedBox(width: Dimentions.width20),
                  Text(
                    tr(context)!.setting,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16
                      )
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }
  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child)
  );
}