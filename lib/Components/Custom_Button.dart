import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() ontap;
  final String text;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 372,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
