import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../detail/log_in_details.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

   // User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
                top: -200,
                bottom: 600,
                right: -100,
                left: -100,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: signUpPageBackgroundColor
                  ),
                )
            ),

            Positioned.fill(
                top: 80,
                bottom: -100,
                left: 25,
                right: 25,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LogInPageDetails(),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
