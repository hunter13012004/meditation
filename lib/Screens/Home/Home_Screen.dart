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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: MediaQuery.of(context).size.height.h,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Welcome, ${widget.user}',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center, // Center content
                        children: [
                          Image.asset(
                            'assets/images/bgg.png',
                            width: 330.w,
                            height: 201.h,
                            fit: BoxFit
                                .cover, // Adjusts image to fill the container
                          ),
                          Positioned(
                            bottom: 80.h, // Adjust position if needed
                            child: Text(
                              '7 Days Of Mindfulness',
                              maxLines: 2,
                              softWrap: true,
                              textAlign:
                                  TextAlign.center, // Center text horizontally
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9A7762))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Start Your Day',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff9A7762))),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Embrace the present moment with awareness and acceptance',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9A7762))),
                      ),
                      IconButton(
                          onPressed: () async {
                            await SignUserOut();
                          },
                          icon: Icon(Icons.login))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
