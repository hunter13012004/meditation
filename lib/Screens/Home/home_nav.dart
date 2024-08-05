import 'package:flutter/material.dart';
import 'package:trial/Screens/Home/Home_Screen.dart';
import 'package:trial/Screens/profile/profile_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

int currentindex = 0;

PageController pageController = PageController();

class _HomeNavState extends State<HomeNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {},
          currentIndex: currentindex,
          unselectedLabelStyle: TextStyle(color: Color(0xffD1B18E)),
          selectedLabelStyle: TextStyle(color: Color(0xff9A7762)),
          unselectedIconTheme: IconThemeData(color: Color(0xffD1B18E)),
          selectedIconTheme: IconThemeData(color: Color(0xff9A7762)),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
          ]),
      body: SafeArea(
        child: Center(
          child: PageView(
            controller: pageController,
            children: [HomeScreen(), ProfileScreen()],
          ),
        ),
      ),
    );
  }
}
