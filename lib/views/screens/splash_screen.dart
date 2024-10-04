import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "🕉",
            style: TextStyle(
              fontSize: 42,
            ),
          ),
          const Image(image: AssetImage('assets/images/bg.png'),),
          const CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 85,
                width: 65,
                child: Image(
                  image: AssetImage("assets/images/1.png"),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Bhagavad Geeta",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
