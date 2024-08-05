import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Components/continue_button.dart';
import 'package:trial/Components/custom_grid_container.dart';
import 'package:trial/Screens/Goals/Goal_page_2.dart';

class GoalPage1 extends StatefulWidget {
  const GoalPage1({super.key});

  @override
  State<GoalPage1> createState() => _GoalPage1State();
}

class _GoalPage1State extends State<GoalPage1> {
  List<Map<String, String>> subscription = [
    {
      'title': '7 Days Duration',
      'value': "val1",
      'image': 'assets/images/bg.png'
    },
    {'title': '14 Days Duration', 'value': "val2", 'image': 'assets/b2.png'},
    {
      'title': '21 Days Duration',
      'value': "val3",
      'image': 'assets/images/bg.png'
    }
  ];

  String defaultvalue = 'val1'; // Changed var to String for type safety

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: MediaQuery.of(context).size.height.h,
          child: SingleChildScrollView(
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
                    Text('1/3',
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
                      child: Center(child: Text('01')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Define Your Goal ",
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
                    Text('Select your meditation goal from below',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14))),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: subscription.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CustomGridContainer(
                        image: subscription[index]['image'] ??
                            'assets/images/bg.png',
                        value: subscription[index][
                            'value'], // Corrected the value to use from the subscription list
                        groupvalue:
                            defaultvalue, // Set the group value to the default value
                        onChanged: (value) {
                          setState(() {
                            defaultvalue = value;
                          });
                        },
                        text: subscription[index]['title']!,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ContinueButton(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoalPage2()));
                          },
                          text: 'Continue')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
