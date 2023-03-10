import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../history_page/history_page.dart';
import '../settings_page/settings_page.dart';
import '../side_bar/side_bar_menu.dart';
import '../tracking_page/tracking_page.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user, }) : super(key: key);

   final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(user: widget.user,),

      body: IndexedStack(
        index: _pageIndex,
        children:  [
          HomeScreen(user: widget.user),
          TrackingPage(),
          HistoryPage(),
          SettingsPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: signUpPageBackgroundColor,
        selectedItemColor: Colors.deepOrange,
        elevation: 5.0,
        onTap: (index){
          setState(()=> _pageIndex = index
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bus_alert_outlined),
              label: "Tracking"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          )
        ],
      ),

    );
  }
}
