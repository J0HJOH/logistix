import 'package:flutter/material.dart';

const Color backgroundColor = Colors.white;
const Color primaryColor = Color(0xFFFF6200);
const Color orangePrimary = Color(0xFFFF8134);
const Color mapBackgroundColor = Color(0xFFC8D4E4);
const signUpPageBackgroundColor = Color(0xFF19677B);

List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.5),
    spreadRadius: -5,
    offset: Offset(-5,-5),
    blurRadius: 30,
  ),
  BoxShadow(
      color: signUpPageBackgroundColor.withOpacity(.2),
      spreadRadius: 2,
      offset: Offset(7,7),
      blurRadius: 20
  )
];