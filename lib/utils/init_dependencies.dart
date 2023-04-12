import 'package:chalenger/controllers/data_model_controller.dart';
import 'package:chalenger/controllers/emoji_keboard_controller.dart';
import 'package:chalenger/controllers/video_controllers.dart';
import 'package:chalenger/views/widgets/home_screen_widgets/video_screen.dart';
import 'package:get/get.dart';


class InitDep extends Bindings {
  @override
  void dependencies() {
    Get.put(MainVideoController(video: item[1]["video"].toString()));
    Get.put(OnProfileVideoController(video: "assets/videos/v_1.mp4"));
    Get.put(EmojiKeyboardController());
    Get.put(UserDataController());
  }

}


// Future <void> initDep() async {
//   Get.put(MainVideoController(video: "assets/videos/v_2.mp4"));
// }