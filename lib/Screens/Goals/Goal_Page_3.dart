import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Components/continue_button.dart';
import 'package:trial/Components/custom_reward_container.dart';
import 'package:trial/Screens/Login_Screens/Signup_Screen.dart';

class GoalPage3 extends StatefulWidget {
  const GoalPage3({super.key});

  @override
  State<GoalPage3> createState() => _GoalPage3State();
}

List rewards = [
  {'title': 'Novice Seeker', 'image': 'assets/images/1.png'},
  {'title': 'zen Virtuoso', 'image': 'assets/images/2.png'},
  {'title': 'Inner Explorer', 'image': 'assets/images/3.png'},
  {'title': 'Mindful Master', 'image': 'assets/images/4.png'},
];

class _GoalPage3State extends State<GoalPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: MediaQuery.of(context).size.height.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HOW TO CREATE A GOAL',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color(0xff939393),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600)),
                  ),
                  Text('3/3',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color(0xff939393),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600))),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Container(
                    height: 58.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xffEBCCB9), Color(0xffF7E1D8)])),
                    child: Center(child: Text('03')),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    "Get Rewards",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 28)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        'Unlock accomplishments after completing your goals.',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14))),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: rewards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CustomRewardContainer(
                      text: rewards[index]['title'],
                      image: rewards[index]['image'],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ContinueButton(
                        ontap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        text: 'Continue')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
