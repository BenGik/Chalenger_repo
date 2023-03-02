import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final fcontroller = ScrollController();

class CreatorProfile extends StatefulWidget {
  const CreatorProfile({super.key});

  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile>
  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController pController = 
    TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
        ),
        leadingWidth: Dimentions.width50,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                Navigator.of(context).pop(),
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                size: Dimentions.size22
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.black,
                size: Dimentions.size22
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: fcontroller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dimentions.height20),
            CircleAvatar(
              radius: Dimentions.r50,
              backgroundColor: Colors.grey.withOpacity(0.2),
              backgroundImage: const AssetImage('assets/images/i_4.jpg'),
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("@username",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: Dimentions.fsz15,
                    ),
                  ),
                  maxLines: 1,
                )
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("1",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.following,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("3",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.followers,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: Dimentions.width50),
                Column(
                  children: [
                    Text("5",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Dimentions.fsz16,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    Text(
                      tr(context)!.likes,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimentions.fsz14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(Dimentions.r5)
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimentions.height10,
                    horizontal: Dimentions.width50
                  ),
                  child: Text(
                    tr(context)!.follow,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimentions.width5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Dimentions.r5)
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimentions.height10,
                    horizontal: Dimentions.width15
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.angleDown,
                    color: Colors.black, 
                    size: Dimentions.size20,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimentions.height15),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.height10
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.5)
                  )
                )
              ),
              height: Dimentions.height35,
              width: double.infinity,
              child: TabBar(
                controller: pController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blueGrey,
                tabs: [
                  Tab(icon: FaIcon(
                      FontAwesomeIcons.chartColumn,
                      size: Dimentions.size20,
                    ),
                  ),
                  Tab(icon: FaIcon(
                      FontAwesomeIcons.heart,
                      size: Dimentions.size20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: Dimentions.height800,
              child: TabBarView(
                controller: pController,
                children: const [
                  CreatorPublictionsView(),
                  CreatorLikesView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreatorPublictionsView extends StatefulWidget {
  const CreatorPublictionsView({super.key});

  @override
  State<CreatorPublictionsView> createState() => _CreatorPublictionsViewState();
}

class _CreatorPublictionsViewState extends State<CreatorPublictionsView> {
  @override
  Widget build(BuildContext context) {
    final scontroller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        controller: scontroller,
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 4 / 5
        ),
        padding: EdgeInsets.only(
          top: Dimentions.height5,
          bottom: Dimentions.height5
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(2),
            )
          );
        }
      ),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        controller: tcontroller,
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 4 / 5
        ),
        padding: EdgeInsets.only(
          top: Dimentions.height5,
          bottom: Dimentions.height5
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