import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../side_bar/side_bar_menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // drawer: SideBar(user: user,),
        body: Center(child: Text('Settings'))
    );;
  }
}
