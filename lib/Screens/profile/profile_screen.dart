import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Screens/Goals/Goal_Page_1.dart';
import 'package:trial/Screens/Goals/Goal_page_2.dart';
import 'package:trial/Screens/onboarding/OnBoardingPage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

bool? istrue;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: MediaQuery.of(context).size.height.h,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo/user-circle.png',
                  height: 140.h,
                  width: 140.w,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 20.sp),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.edit_note_sharp))
                ],
              ),
              Center(
                child: Text(
                  'Emial id',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Color(0xffB9B9B9)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Notifications',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Color(0xffB9B9B9)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mindful Tips',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  CupertinoSwitch(
                    value: istrue!,
                    onChanged: (value) {
                      setState(() {
                        istrue = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Reminders & Rewards',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Color(0xffB9B9B9)),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Set a Reminder',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Reminders & Rewards',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Color(0xffB9B9B9)),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GoalPage1()));
                },
                child: Text(
                  'Define Your Goal',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GoalPage2()));
                },
                child: Text(
                  'Get Specific',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnBoardingPage()));
                },
                child: Text(
                  'Log Out',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
