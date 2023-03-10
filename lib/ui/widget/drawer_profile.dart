import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DrawerProfile extends StatelessWidget {
  final User user;

  const DrawerProfile({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.displayName!),
      accountEmail: Text(user.email!),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.asset(
            'woman_profile.jpg',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        image: DecorationImage(
            fit: BoxFit.fill,
          image: AssetImage('lime_background.jpg'),
        ),
      ),
    );
  }
}
