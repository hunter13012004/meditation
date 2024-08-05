import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Components/Custom_texfeild.dart';
import 'package:trial/Components/google_button.dart';
import 'package:trial/Screens/Home/Home_Screen.dart';
import 'package:trial/Screens/Login_Screens/Login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool obscuretext = true;

  // Signup function
  Future<void> SignUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user:
                        FirebaseAuth.instance.currentUser?.email?.split("@")[0],
                  )));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  // Google login function
  Future LoginWithGoogle() async {
    final googlelog = await GoogleSignIn().signIn();
    final googleAuth = await googlelog!.authentication;
    final googlecreds = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  user: googlelog.displayName,
                )));
    return FirebaseAuth.instance.signInWithCredential(googlecreds);
  }

  static GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isgooglelogin = false;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          height: 249.h,
                          width: 257.w,
                        ),
                        Positioned(
                            child: Image.asset(
                          'assets/images/star.png',
                          height: 69.h,
                          width: 69.w,
                        )),
                        Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/star.png',
                              height: 69.h,
                              width: 69.w,
                            )),
                        Positioned(
                            bottom: 0,
                            left: 80,
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32.sp)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    isloading == false
                        ? isgooglelogin == false
                            ? GoogleButton(
                                text: 'Google Sign Up',
                                ontap: () async {
                                  setState(() {
                                    isgooglelogin = true;
                                  });
                                  await LoginWithGoogle();
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: Colors.black,
                              ))
                        : Container(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text('or'),
                        Expanded(child: Divider())
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Email-ID',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTexfeild(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!value.contains("@")) {
                                return 'Email is invalid';
                              } else {
                                return null;
                              }
                            },
                            obscuretext: false,
                            controller: emailcontroller,
                            hinttext: 'Enter your email',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Password',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTexfeild(
                            icon: obscuretext == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onPressed: () {
                              setState(() {
                                obscuretext = !obscuretext;
                              });
                            },
                            obscuretext: obscuretext,
                            controller: passwordcontroller,
                            hinttext: 'Create password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6) {
                                return 'Password length must be more than 6';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          isgooglelogin == false
                              ? isloading == false
                                  ? CustomButton(
                                      text: 'Sign Up',
                                      ontap: () async {
                                        if (_formkey.currentState!.validate()) {
                                          setState(() {
                                            isloading = true;
                                          });
                                          await SignUpWithEmailAndPassword();
                                        }
                                      })
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    )
                              : Container(),
                          SizedBox(
                            height: 20.h,
                          ),
                          isgooglelogin == false
                              ? isloading == false
                                  ? RichText(
                                      text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Already a member? ',
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: Colors.black))),
                                      TextSpan(
                                          text: 'Log in',
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: Color(0xffD1B18E)),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()));
                                            }),
                                    ]))
                                  : Container()
                              : Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
