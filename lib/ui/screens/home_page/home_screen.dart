import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logistix/ui/screens/home_page/select_location_screen/select_location.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widget/home_page_buttons.dart';
import '../side_bar/side_bar_menu.dart';
import 'home_send_parcel/package_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: SideBar(user: widget.user,),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                alignment: Alignment.topLeft,
                child: Image(
                  image: AssetImage('logistix_second_logo.png'),
                  height: 14,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                child: Row(
                  children: [
                    Text(
                        'Welcome, ',
                      style: TextStyle(
                          color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                      ),
                    ),
                    Text(
                       '${widget.user.displayName}',
                      style: TextStyle(
                          color: signUpPageBackgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                    'where are you sending a package to today?',
                  style: TextStyle(
                      color: signUpPageBackgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12                  ),
                ),
              ),

              SizedBox(height: 40,),

              HomePageButtons(
                btnText: 'Select location',
                btnprefixIcon: Icons.location_on,
                btnPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context)
                => SelectLocation(user: widget.user,
                  description: '',
                  category: '',))
                ),
              ),

              SizedBox(height: 40,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                    'What Do You WantTo Do?',
                  style: TextStyle(
                      color: signUpPageBackgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                ),
              ),

              SizedBox(height: 5,),

              HomePageButtons(
                btnText: 'Send Parcel',
                btnprefixIcon: Icons.delivery_dining_outlined,
                btnsuffixIcon: Icons.arrow_right_alt,
                btnPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> PackageDetailsPage())
                ),
              ),

              SizedBox(height: 40,),

              HomePageButtons(
                btnText: 'Track Order',
                btnprefixIcon: Icons.calendar_month_rounded,
                btnsuffixIcon: Icons.arrow_right_alt,
                btnPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> PackageDetailsPage())
                ),
              ),

              SizedBox(height: 40,),

              HomePageButtons(
                  btnText: 'Book Advance Delivery',
                  btnprefixIcon: Icons.note_add_outlined,
                  btnsuffixIcon: Icons.arrow_right_alt,
                  btnPressed: ()=> Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> PackageDetailsPage())
                  ),
              ),

              SizedBox(height: 40,),

              HomePageButtons(
                  btnText: 'Recieve Parcel',
                  btnprefixIcon: Icons.card_giftcard,
                  btnsuffixIcon: Icons.arrow_right_alt,
                  btnPressed: ()=> Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> PackageDetailsPage())
                  ),
              )
            ],
          ),
        )
    );
  }
}
