import 'package:flutter/material.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Screens/Login_Screens/login_Screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password reset link has been sent to your email address. Click confirm to continue',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: 'Confirm',
                          ontap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          })
                    ]))));
  }
}
