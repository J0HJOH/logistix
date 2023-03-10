import 'package:flutter/material.dart';


class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image(image: AssetImage('assets/logistix_second_logo.png')));
  }
}
