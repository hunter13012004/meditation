import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Please enter your email to reset your password',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email-ID',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: CustomTexfeild(
                    validator: (value) {
                      if (value == ' ') {
                        return 'Email cannot be empty';
                      } else if (!value!.contains('@gmail.com')) {
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
                height: 20,
              ),
              CustomButton(
                  text: 'Reset password',
                  ontap: () async {
                    await ResetPassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
