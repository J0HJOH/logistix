import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../data/models/parcel_description.dart';
import '../../../widget/button.dart';
import '../../../widget/map_sample.dart';
import '../../side_bar/side_bar_menu.dart';
import '../riders/available_riders.dart';

class SelectLocation extends StatefulWidget {
  final Parcel? myParcel;
  const SelectLocation({
    Key? key, required this.user,
    required this.myParcel,
  }) : super(key: key);

  final User user;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

@override
  void initState() {
    MapSample();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEDE2),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications)
          ),

        ],
        elevation: 0.0,
        foregroundColor: signUpPageBackgroundColor,
        backgroundColor: Color(0xFFFEEDE2),
      ),
      drawer: SideBar(user: widget.user,),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 20,
                shadowColor: signUpPageBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: signUpPageBackgroundColor,
                    width: 3.0,
                      style: BorderStyle.solid
                  )
                ),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      maxWidth: 90.w,
                      minHeight: 50.h,
                      minWidth: 90.w
                      ),
                  child: MapSample(),
                ),
              ),
              
              SizedBox(height: 5.h,),

              Divider(
                thickness: 3.0,
                indent: 90.0,
                endIndent: 90.0,
                color: signUpPageBackgroundColor,),

              Material(
                shadowColor: signUpPageBackgroundColor,
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 90.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD9D9D9),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: locationController,
                        decoration: InputDecoration(
                          label: Text(
                              'Select location',
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                          border: InputBorder.none,
                          constraints: BoxConstraints(
                            maxHeight: 6.h,
                            maxWidth: 70.w,
                          ),
                          prefixIcon: Icon(Icons.location_history),
                          prefixIconColor: primaryColor
                        ),
                      ),

                      Divider(color: primaryColor,),

                      TextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: destinationController,
                        decoration: InputDecoration(
                          label: Text(
                              'Search',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                            border: InputBorder.none,
                            constraints: BoxConstraints(
                              maxHeight: 6.h,
                              maxWidth: 70.w,
                            ),
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: primaryColor
                        ),
                      ),
                    ],
                  ),
                  )
              ),

              SizedBox(height: 2.h,),
              ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)
                    => AvailableRidersScreen(
                      location: locationController.text,
                      destination : destinationController.text,
                      parcel: widget.myParcel
                    )
                )
            );
          },
          label: Text('Connect to rider'),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
    );
  }
}
