import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRewardContainer extends StatelessWidget {
  final String text;
  final String image;
  final Function() ontap;
  const CustomRewardContainer(
      {super.key,
      required this.text,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Container(
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ),
                    Image.asset(
                      image,
                      height: 91.h,
                      width: 95.w,
                    )
                  ],
                ))
          ])),
    );
  }
}
