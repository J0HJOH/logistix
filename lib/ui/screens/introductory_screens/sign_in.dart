import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../detail/sign_in_details.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                    color: Color(0xFFFF8134)
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
                    child: SignInPageDetail(),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: signUpPageBackgroundColor,
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
