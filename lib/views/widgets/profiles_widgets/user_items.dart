import 'package:flutter/material.dart';


class UserPublictionsView extends StatefulWidget {
  const UserPublictionsView({super.key});

  @override
  State<UserPublictionsView> createState() => _UserPublictionsViewState();
}

class _UserPublictionsViewState extends State<UserPublictionsView> {
  @override
  Widget build(BuildContext context) {
    final scontroller = ScrollController();
    return CustomScrollView(
      controller: scontroller,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              )),
            );
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


class UserLikesView extends StatefulWidget {
  const UserLikesView({super.key});

  @override
  State<UserLikesView> createState() => _UserLikesViewState();
}

class _UserLikesViewState extends State<UserLikesView> {
  @override
  Widget build(BuildContext context) {
    final tcontroller = ScrollController();
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tcontroller,
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ));
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