import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';


class EmojiPack extends StatefulWidget {
  const EmojiPack({super.key});

  @override
  State<EmojiPack> createState() => _EmojiPackState();
}

class _EmojiPackState extends State<EmojiPack> {
  // final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  @override
  Widget build(BuildContext context) {
    return const EmojiPicker(
        // onEmojiSelected: (category, emoji) {
        //   print(emoji);
        // },
        // config: const Config(
        //   columns: 7,
        //   verticalSpacing: 0,
        //   horizontalSpacing: 0
        // ),
    );
  }
}