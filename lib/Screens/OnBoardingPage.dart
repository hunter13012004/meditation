import 'package:flutter/material.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Screens/Login_Screens/Signup_Screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Group 62.png',
                height: 319,
                width: 264,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Make Meditation Your",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Text(
                'Daily Ritual',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                text: 'Start your journey!',
              )
            ],
          ),
        ),
      ),
    );
  }
}
