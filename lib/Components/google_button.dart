import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const GoogleButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 327,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff232831))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/googlelogo.png',
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
