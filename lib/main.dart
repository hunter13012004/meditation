import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trial/Screens/Splash/Splash_screen.dart';
import 'package:trial/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(360, 890),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xffF9F5F0)),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
