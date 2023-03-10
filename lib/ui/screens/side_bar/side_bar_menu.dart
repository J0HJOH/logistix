import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widget/button.dart';
import '../../widget/drawer_profile.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerProfile(user: widget.user,),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.star),
            title: Text('Rate your Driver'),
            onTap: (){},
          ),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.wallet),
            title: Text('Wallet'),
            onTap: (){},
          ),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.call),
            title: const Text('Call a representative'),
            onTap: (){},
          ),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){},
          ),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.chat_bubble),
            title: Text('Live Chat'),
            onTap: (){},
          ),
          ListTile(
            iconColor: primaryColor,
            leading: const Icon(Icons.mail),
            title: Text('Mail'),
            onTap: (){},
            trailing: ClipOval(
              child: Container(
                color: primaryColor,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            iconColor: primaryColor,
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: (){},
          ),

          Divider(
            height: 10.h,
            thickness: 3.0,
            color: signUpPageBackgroundColor,
          ),

          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 8.h,
              maxWidth: 60.w
            ),
              child: Button(
                width: 20.w,
                buttonText: 'Driver\'s Mode',
                buttonColor: signUpPageBackgroundColor,
                onPressed: (){},
                height: 3.h,
                txtcolor: Colors.white
            ),
          )

        ],
      ),

    );
  }
}

