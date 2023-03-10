import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:logistix/ui/screens/introductory_screens/sign_in.dart';

import '../../../constants/colors.dart';
import '../../widget/button.dart';
import 'log_in.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context,signLogIn)
  {
    if(signLogIn == 'SignIn'){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
    }else if(signLogIn == 'LogIn'){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) =>  LogInPage()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w700,
          color: orangePrimary
      ),
      bodyTextStyle: TextStyle(
          fontSize: 15.0,
          fontFamily: 'evolventa',
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
      bodyPadding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
      titlePadding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
      imagePadding: EdgeInsets.fromLTRB(20, 40, 10, 10),
      pageColor: backgroundColor,
    );

    return SafeArea(
        child: IntroductionScreen(
          globalHeader: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30),
            child: Image(image: AssetImage('assets/logistix_first_logo.png'),),
          ),
            key: introKey,
            globalBackgroundColor: backgroundColor,
            allowImplicitScrolling: true,
            showNextButton: true,
            showSkipButton: false,
            showDoneButton: false,
            nextStyle: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => primaryColor),
              padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.all(20)),
              elevation: MaterialStateProperty.resolveWith((states) => 30),
              alignment: Alignment.center,

            ),
            next: Text('Next',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            dotsDecorator: DotsDecorator(
              // size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: primaryColor,
              color: Colors.black26,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
            ),
            autoScrollDuration: 5000,
            pages: [
              PageViewModel(
                title: "Delivery Service For Everyone",
                body: "Reliable delivery services across the nation for everyone and anyone",
                image: Image(
                    image: AssetImage('delivery1.png'),
                ),
                decoration: pageDecoration
              ),
              PageViewModel(
                title: "Effective Tracking System",
                body: "Enjoy Real Time Tracking Of Your Goods anywhere you are in the world",
                image: Image(
                    image: AssetImage('new_tracking.png'),
                ),
                decoration: pageDecoration
              ),
              PageViewModel(
                  title: "Reliable Customer Support",
                  body: "Enquires, Request, And Complaint Resolutions On The Go",
                  image: Image(
                    image: AssetImage('service.png'),
                  ),
                  decoration: pageDecoration
              ),
              PageViewModel(
                title: "Multiple and Safe Delivery Options",
                body: "Different safe delivery options to choose from",
                image: Image(
                    image: AssetImage('diff_delivery.png'),

                ),
                footer:
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        width: 100,
                        buttonText: "Get Started",
                        buttonColor: primaryColor,
                        onPressed: (){
                          setState(() {
                            _onIntroEnd(context, 'SignIn');
                          });
                        },
                        height: 30,
                        txtcolor: Colors.white
                      ),
                      Button(width: 120,
                      buttonText: "Log In",
                      buttonColor: Colors.white,
                      onPressed:  (){
                        setState(() {
                            _onIntroEnd(context, 'LogIn');
                        });
                        },
                          height: 30,
                          txtcolor: primaryColor
                      )
                    ],
                  ),
                ),
                decoration: pageDecoration.copyWith(
                  footerPadding: EdgeInsets.all(10),
                )
              ),
            ]
        )
    );
  }
}
