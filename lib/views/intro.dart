import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_screen extends StatefulWidget {
  Intro_screen({Key? key}) : super(key: key);

  @override
  State<Intro_screen> createState() => _Intro_screenState();
}

class _Intro_screenState extends State<Intro_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
                image: FlutterLogo(),
                title: "welcome to contact diary app",
                body: "we have amazing app"),
            PageViewModel(
                image: FlutterLogo(),
                title: "welcome to contact diary app",
                body: "we have amazing app"),
            PageViewModel(
                image: FlutterLogo(),
                title: "welcome to contact diary app",
                body: "we have amazing app"),
            PageViewModel(
                image: FlutterLogo(),
                title: "welcome to contact diary app",
                body: "we have amazing app"),
          ],
          done: Text("done"),
          onDone: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool('IsIntroVisited', true);
            Navigator.pushReplacementNamed(context, "home");
          },
          next: Text("go next page"),
          showNextButton: true,
          skip: Text("skip"),
          onSkip: () {
            Navigator.pushReplacementNamed(context, "home");
          },
          showSkipButton: true,
        ),
      ),
    );
  }
}
