import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Screens/Goals/Goal_Page_1.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Group 62.png',
                    height: 319.h,
                    width: 264.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Make Meditation Your",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Daily Ritual',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 20.h), // Optional padding from bottom
              child: CustomButton(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalPage1(),
                    ),
                  );
                },
                text: 'Start your journey!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
