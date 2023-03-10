
import 'package:flutter/material.dart';
import 'package:logistix/constants/colors.dart';

class Button extends StatefulWidget {
  final double width;
  final double height;
  final String buttonText;
  final Color buttonColor;
  final  onPressed;
  final Color txtcolor;

  const Button({Key? key,
    required this.width,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
    required this.height, required this.txtcolor}
      ) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: widget.width, vertical: widget.height),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          backgroundColor: widget.buttonColor,
        side: BorderSide(color: primaryColor, )
      ),
      child: Text(
        widget.buttonText,
        style: TextStyle(color: widget.txtcolor, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
