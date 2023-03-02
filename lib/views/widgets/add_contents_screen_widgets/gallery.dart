import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController xController = 
    TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        centerTitle: true,
        title: Align(
          alignment: Alignment.topCenter,
          child: TabBar(
            controller: xController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blueGrey,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimentions.fsz16
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Dimentions.fsz15
            ),
            tabs: [
              const Tab(text: "tous"),
              Tab(text: tr(context)!.video),
              Tab(text: tr(context)!.picture)
            ],
          ),
        ),
        elevation: 1,
        backgroundColor: const Color(0xFF010212),
      ),
      body: TabBarView(
        controller: xController,
        children: const [
          ImagesAndVideosView(),
          VideosView(),
          PicturesView()
        ],
      ),
    );
  }
}


class ImagesAndVideosView extends StatefulWidget {
  const ImagesAndVideosView({super.key});

  @override
  State<ImagesAndVideosView> createState() => _ImagesAndVideosViewState();
}

class _ImagesAndVideosViewState extends State<ImagesAndVideosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010212),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }
      )
    );
  }
}


class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010212),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }
      )
    );
  }
}


class PicturesView extends StatefulWidget {
  const PicturesView({super.key});

  @override
  State<PicturesView> createState() => _PicturesViewState();
}

class _PicturesViewState extends State<PicturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010212),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            )
          );
        }
      ),
    );
  }
}