import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomGridContainer extends StatelessWidget {
  void Function() onChanged;
  final String? value;
  String? groupvalue;
  final String text;
  CustomGridContainer(
      {super.key,
      required this.value,
      required this.text,
      required this.groupvalue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Radio(
                      activeColor: Colors.black,
                      value: value,
                      groupValue: groupvalue,
                      onChanged: (value) {},
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          maxLines: 2,
                          text,
                          style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9A7762)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
