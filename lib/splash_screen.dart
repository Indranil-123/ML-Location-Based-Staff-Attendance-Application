import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mtgi/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4),(){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>const LoginScreen()
          ));

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/teresa.jpg')),
            Text("M T G I",style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300
            ),),
            SizedBox(height: 20,),
            Text("www.mtgi.in",style: TextStyle(
              fontSize: 10,
            ),),
          ],
        ),
      ),
    );
  }
}
