import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class MainVideoController extends GetxController {
  late VideoPlayerController mainVideoPlayerController;
  final String? video;
  MainVideoController({
    required this.video
  });

  @override
  void onInit() {
    super.onInit();
    mainVideoPlayerController = VideoPlayerController.asset(video!)
    ..addListener(() => update())
    ..setLooping(true);
  }


  @override
  void onClose() {
    super.onClose();
    mainVideoPlayerController.dispose();
    update();
  }

  String position () {
      final duration = Duration(
        milliseconds: mainVideoPlayerController.value.position.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
  }

  String duration () {
      final duration = Duration(
        milliseconds: mainVideoPlayerController.value.duration.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
  }
}


class OnProfileVideoController extends GetxController {
  late VideoPlayerController onProfileVideoController;
  final String? video;
  OnProfileVideoController({
    required this.video
  });

  @override
  void onInit() {
    super.onInit();
    onProfileVideoController = VideoPlayerController.asset(video!)
    ..addListener(() => update())
    ..setLooping(true);
  }


  @override
  void onClose() {
    super.onClose();
    onProfileVideoController.dispose();
  }

  String position () {
      final duration = Duration(
        milliseconds: onProfileVideoController.value.position.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
  }

  String duration () {
      final duration = Duration(
        milliseconds: onProfileVideoController.value.duration.inMilliseconds.round()
      );
      return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(" : ");
  }
}


class VideoPreviewController extends GetxController {
  late VideoPlayerController videoPreviewController;
  final String? video;
  VideoPreviewController({
    required this.video
  });

  @override
  void onInit() {
    super.onInit();
    videoPreviewController = VideoPlayerController.asset(video!)
    ..addListener(() => update())
    ..setLooping(true);
  }


  @override
  void onClose() {
    super.onClose();
    videoPreviewController.dispose();
  }
}