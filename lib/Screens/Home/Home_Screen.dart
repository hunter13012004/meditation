import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Screens/onboarding/OnBoardingPage.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String? user;
  HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> SignUserOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height.h,
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome , ${widget.user}',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.sp)),
                      ),
                      IconButton(
                          onPressed: () async {
                            await SignUserOut();
                          },
                          icon: Icon(Icons.login))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Group.png',
                    height: 118.h,
                    width: 122.w,
                  ),
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
