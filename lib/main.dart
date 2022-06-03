import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'View/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIMES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      textTheme:GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/letter-t-icon-png-29.png',fit: BoxFit.none,),
        nextScreen: homescreen(),
        duration: 3000 ,
        splashIconSize:double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType:PageTransitionType.bottomToTop,
      ),
    );
  }
}









