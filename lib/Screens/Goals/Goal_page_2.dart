import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Components/continue_button.dart';
import 'package:trial/Screens/Goals/Goal_Page_3.dart';

class GoalPage2 extends StatefulWidget {
  const GoalPage2({super.key});

  @override
  State<GoalPage2> createState() => _GoalPage2State();
}

class _GoalPage2State extends State<GoalPage2> {
  List goals = [
    {'title': 'I will become a mindful person', 'value': 'val1'},
    {'title': 'I will improve my focus', 'value': 'val2'},
    {'title': 'I will become a happy person', 'value': 'val3'},
    {'title': 'I will improve my relationships', 'value': 'val4'},
  ];

  String defaultvalue = 'val1';

  final TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: MediaQuery.of(context).size.height.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '2/3',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Color(0xff939393),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                          colors: [Color(0xffEBCCB9), Color(0xffF7E1D8)],
                        ),
                      ),
                      child: Center(child: Text('02')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Get Specific ",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'What do you hope to accomplish after completing your goal?',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [Expanded(child: Divider())],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Type your own answer or select from below',
                  softWrap: true,
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: goals.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              tileColor: Colors.white,
                              title: Text(
                                goals[index]['title']!,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                              leading: Radio<String>(
                                activeColor: Colors.black,
                                value: goals[index]['value']!,
                                groupValue: defaultvalue,
                                onChanged: (value) {
                                  setState(() {
                                    defaultvalue = value!;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextField(
                        controller: textcontroller,
                        decoration: InputDecoration(
                            hintText: 'Type your own answer',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ContinueButton(
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GoalPage3()));
                              },
                              text: 'Continue')
                        ],
                      )
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
