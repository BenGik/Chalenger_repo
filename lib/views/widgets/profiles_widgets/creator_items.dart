import 'package:chalenger/views/screens/on_profil_screen_video_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreatorPublictionsView extends StatefulWidget {
  const CreatorPublictionsView({super.key});

  @override
  State<CreatorPublictionsView> createState() => _CreatorPublictionsViewState();
}

class _CreatorPublictionsViewState extends State<CreatorPublictionsView> {
  @override
  Widget build(BuildContext context) {
    final scontroller = ScrollController();
    return CustomScrollView(
      controller: scontroller,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(2),
            ));
          },
          childCount: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 4 / 5
          )
        )
      ]
    );
  }
}


class CreatorLikesView extends StatefulWidget {
  const CreatorLikesView({super.key});

  @override
  State<CreatorLikesView> createState() => _CreatorLikesViewState();
}

class _CreatorLikesViewState extends State<CreatorLikesView> {
  @override
  Widget build(BuildContext context) {
    final tcontroller = ScrollController();
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tcontroller,
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
              onTap: () => Get.to(const OnProfileVideoViewScreen()),
              child: Container(
                decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(2),
              )),
            );
          },
          childCount: 28
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 4 / 5
          )
        )
      ]
    );
  }
}