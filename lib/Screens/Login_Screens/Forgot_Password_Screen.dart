import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Components/Custom_texfeild.dart';
import 'package:trial/Screens/Login_Screens/Confirmation_Screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();

  // function for forgotpassword page ==============?
  Future ResetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ConfirmationScreen()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  bool isloading = false;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height.h,
            width: MediaQuery.of(context).size.width.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 28.sp)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Please enter your email to reset your password',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14.sp)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Email-ID',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.sp)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: CustomTexfeild(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email cannot be empty';
                        } else if (!value.contains('@gmail.com')) {
                          return 'invalid email ';
                        } else {
                          return null;
                        }
                      },
                      hinttext: 'Enter your email',
                      controller: emailcontroller,
                      obscuretext: false),
                ),
                SizedBox(
                  height: 50.h,
                ),
                isloading == false
                    ? CustomButton(
                        text: 'Reset password',
                        ontap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            await ResetPassword();
                          }
                        })
                    : Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
