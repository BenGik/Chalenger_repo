import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';


class EmojiKeyboardController extends GetxController {
  bool isEmojiKeyboardVisible = false;
  late StreamSubscription<bool> isKeyboardVisible;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  void onEmojiSelected(category, emoji) {
    textEditingController.text = textEditingController.text + emoji.emoji;
    update();
  }

  void unFocus() {
    focusNode.unfocus();
    update();
  }

  void focusRequest() {
    focusNode.canRequestFocus = true;
  }

  @override
  void onInit() {
    super.onInit();
    // focusNode.addListener(() {
    //   if (focusNode.hasFocus) {
    //     isEmojiKeyboardVisible = false;
    //   }
    // });
    var keyboardVisibilityController = KeyboardVisibilityController();
    isKeyboardVisible = keyboardVisibilityController.onChange.listen((bool isKeyboardVisible) {

      if (isKeyboardVisible && isEmojiKeyboardVisible) {
        isEmojiKeyboardVisible = false;
      }
    });
  }

  void changeControllerValue() {
    isEmojiKeyboardVisible = !isEmojiKeyboardVisible;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    isKeyboardVisible.cancel();
  }
}