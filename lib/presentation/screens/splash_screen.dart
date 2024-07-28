import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String assetName = 'assets/splash_cat.svg';

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: size.height * .1),
              Text("Catbreeds",
                  style: GoogleFonts.gloriaHallelujah().copyWith(
                    fontSize: size.aspectRatio * 80,
                    fontWeight: FontWeight.bold,
                  )),
              buildSvg(assetName, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSvg(String assetName, BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SvgPicture.asset(assetName,
        semanticsLabel: 'Cat Logo',
        height: size.height * 0.3,
        width: size.width * 0.7);
  }
}
