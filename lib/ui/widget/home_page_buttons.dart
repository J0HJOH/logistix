import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class HomePageButtons extends StatefulWidget {
  final String btnText;
  final IconData btnprefixIcon;
  final IconData? btnsuffixIcon;
  final Function()? btnPressed;
  const HomePageButtons(
      {Key? key,
        required this.btnText,
        required this.btnprefixIcon,
        this.btnsuffixIcon,
        required this.btnPressed
  }) : super(key: key);

  @override
  State<HomePageButtons> createState() => _HomePageButtonsState();
}

class _HomePageButtonsState extends State<HomePageButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:
          widget.btnPressed
        ,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          minimumSize: Size(350, 60),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: signUpPageBackgroundColor,
    ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
                widget.btnprefixIcon,
              size: 30,
            ),
            Text(
                widget.btnText,
            ),
            Icon(
                widget.btnsuffixIcon,
              size: 20,
            )
          ],
        ),
    );
  }
}
