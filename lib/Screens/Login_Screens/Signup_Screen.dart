import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  //controlller here ===================>
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
// signup function here ===================>

  Future SignUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());

      // add navigator here to home screen

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: FirebaseAuth.instance.currentUser?.email,
                  )));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  /// google login function here  ===============>
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

  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
        body: Form(
      key: formkey,
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
                          left: 70,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 32),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GoogleButton(
                    text: 'Google Sign Up',
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
                            if (value!.isEmpty) {
                              return 'Email cannot be empty';
                            } else if (value.contains("@gmail.com")) {
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
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            )
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
                          obscuretext: obscuretext,
                          controller: passwordcontroller,
                          hinttext: 'Create password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password cannot be empty';
                            } else if (value.length < 6) {
                              return 'password lenght must be more than 6';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            text: 'Sign Up',
                            ontap: () async {
                              if (formkey.currentState!.validate()) {
                                await SignUpWithEmailAndPassword();
                              } else {
                                throw Exception('Error');
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Already a member? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color(0xffD1B18E)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
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
    ));
  }
}
