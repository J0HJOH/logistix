import 'dart:async';

import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'intro_screens.dart';

class LogistixSplashScreen extends StatefulWidget {
  const LogistixSplashScreen({Key? key}) : super(key: key);

  @override
  State<LogistixSplashScreen> createState() => _LogistixSplashScreenState();
}

class _LogistixSplashScreenState extends State<LogistixSplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                IntroScreens()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('logo_main.png'),),
            Image(
              image: AssetImage('assets/logistix_first_logo.png'),
              fit: BoxFit.cover,
              height: 30,
      ),
          ],
        )
      )
    );

  }
}
