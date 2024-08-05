import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trial/Components/Custom_Button.dart';
import 'package:trial/Components/Custom_texfeild.dart';
import 'package:trial/Components/google_button.dart';
import 'package:trial/Screens/Home/Home_Screen.dart';
import 'package:trial/Screens/Login_Screens/Forgot_Password_Screen.dart';
import 'package:trial/Screens/Login_Screens/Signup_Screen.dart';

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
                    user: user.user?.email,
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
    return FirebaseAuth.instance.signInWithCredential(googlecreds);
  }

  bool obscuretext = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
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
                          height: 249,
                          width: 257,
                        ),
                        Positioned(
                            child: Image.asset(
                          'assets/images/star.png',
                          height: 69,
                          width: 69,
                        )),
                        Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/star.png',
                              height: 69,
                              width: 69,
                            )),
                        Positioned(
                            bottom: 0,
                            left: 80,
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 32),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GoogleButton(
                      text: 'Google Log In',
                      ontap: () async {
                        await LoginWithGoogle();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text('or'),
                        Expanded(child: Divider())
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Email-ID',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
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
                            height: 8,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xffD1B18E)))),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              text: 'Log In',
                              ontap: () async {
                                if (formkey.currentState!.validate()) {
                                  await LoginUserWithEmailAndPassword();
                                } else {
                                  throw Exception('There is some error');
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Not a member? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.black)),
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffD1B18E)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  }),
                          ]))
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
