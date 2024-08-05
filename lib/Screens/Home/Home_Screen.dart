import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial/Screens/OnBoardingPage.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String? user;
  HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> SignUserOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome , ${widget.user}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      IconButton(
                          onPressed: () async {
                            await SignUserOut();
                          },
                          icon: Icon(Icons.login))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Group.png',
                    height: 118,
                    width: 122,
                  ),
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
