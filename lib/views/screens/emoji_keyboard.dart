import 'package:chalenger/controllers/emoji_keboard_controller.dart';
import 'package:chalenger/utils/dimentions.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EmojiKeyBoard extends StatelessWidget {
  const EmojiKeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    EmojiKeyboardController controller = Get.find();
    return GetBuilder<EmojiKeyboardController>(
      builder: (_) {
        return Offstage(
          offstage: !controller.isEmojiKeyboardVisible,
          child: SizedBox(
            height: Dimentions.height40*7,
            child: EmojiPicker(
              // onEmojiSelected: OnEmojiSelected
              config: Config(
                columns: 9,
                replaceEmojiOnLimitExceed: true,
                recentsLimit: 45,
                showRecentsTab: true,
                buttonMode: ButtonMode.MATERIAL,
                noRecents: Container(),
                emojiSizeMax: Dimentions.size12*2,
                bgColor: Color(0xFF010212),
                indicatorColor: Colors.amber,
                iconColorSelected: Colors.white,
                categoryIcons: const CategoryIcons(
                  recentIcon: FontAwesomeIcons.clock,
                  smileyIcon: FontAwesomeIcons.faceSmile,
                  animalIcon: FontAwesomeIcons.dove,
                  foodIcon: FontAwesomeIcons.mugHot,
                  travelIcon: FontAwesomeIcons.planeDeparture,
                  activityIcon: FontAwesomeIcons.personSnowboarding,
                  objectIcon: FontAwesomeIcons.lightbulb,
                  symbolIcon: FontAwesomeIcons.question,
                  flagIcon: FontAwesomeIcons.flagCheckered
                ),
              ),
            ),
          ),
        );
      }
    ); 
  }
}