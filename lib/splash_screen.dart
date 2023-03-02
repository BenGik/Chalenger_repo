import 'package:chalenger/utils/dimentions.dart';
import 'package:chalenger/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => 
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen())
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF010212),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF010212),
          statusBarIconBrightness: Brightness.dark ,
          systemNavigationBarColor: Color(0xFF010212),
          systemNavigationBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Center(
            child: Image(
              image: AssetImage("assets/icons/ic_2.png"),
              width: 100,
            )
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "From  Cuybi",
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: Dimentions.fsz16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Image(
                    image: AssetImage("assets/icons/ic_2.png"),
                    width: 30,
                  )
                ],
              ),
            ), 
          )
        ],
      )
    );
  }
}