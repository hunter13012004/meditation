import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const GoogleButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40.h,
        width: 327.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xff232831))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/googlelogo.png',
              height: 20.h,
              width: 20.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              text,
              style: GoogleFonts.inter(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp)),
            )
          ],
        ),
      ),
    );
  }
}
