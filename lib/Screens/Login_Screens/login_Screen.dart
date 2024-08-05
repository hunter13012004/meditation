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
import 'package:trial/Screens/Login_Screens/Forgot_Password_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers for textfeilds
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // login function ======================>

  Future LoginUserWithEmailAndPassword() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: user.user?.email?.split('@')[0],
                  )));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  //google login function ============================>
  Future LoginWithGoogle() async {
    final googlelog = await GoogleSignIn().signIn();
    final googleAuth = await googlelog!.authentication;
    final googlecreds = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(googlecreds);
  }

  bool isgooglelogin = false;
  bool isloading = false;
  bool obscuretext = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formkey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
                            left: 90,
                            child: Text(
                              'Log In',
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
                                text: 'Google Log In',
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
                                ),
                              )
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
                              if (value == '') {
                                return 'Email cannot be empty';
                              } else if (!value!.contains("@gmail.com")) {
                                return 'Email is invalid';
                              } else {
                                return null;
                              }
                            },
                            controller: emailcontroller,
                            obscuretext: false,
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
                              ),
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
                            validator: (value) {
                              if (value == '') {
                                return 'password cannot be empty';
                              } else {
                                return null;
                              }
                            },
                            controller: passwordcontroller,
                            obscuretext: obscuretext,
                            hinttext: 'Enter your password',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgotPasswordScreen()));
                                        },
                                      text: 'Forgot password',
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: Color(0xffD1B18E))))),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          isgooglelogin == false
                              ? isloading == false
                                  ? CustomButton(
                                      text: 'Log In',
                                      ontap: () async {
                                        if (_formkey.currentState!.validate()) {
                                          setState(() {
                                            isloading = true;
                                          });
                                          await LoginUserWithEmailAndPassword();
                                        } else {
                                          throw Exception(
                                              'There is some error');
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
                                          text: 'Not a member? ',
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: Colors.black))),
                                      TextSpan(
                                          text: 'Sign Up',
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: Color(0xffD1B18E))),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pop(context);
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
