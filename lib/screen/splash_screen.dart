import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galaxy_planets/screen/HomePage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 3);
    Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xff101438),
        child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.15),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "BMI CALCULATOR",
                style: const TextStyle(fontSize: 28, color: Colors.white),


              ),
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.35),
            Spacer(),
            LoadingAnimationWidget.staggeredDotsWave(color: Colors.pink, size: 50),
            const SizedBox(
                height: 40),
            const Text(
              "Check your BMI",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
                height: 40)
          ],
        ),
      ),
    );
  }
}
