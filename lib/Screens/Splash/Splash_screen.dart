import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trial/Screens/Auth/Auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: LottieBuilder.asset('assets/Meditate Mantra.json'),
        ),
      ),
    );
  }
}
