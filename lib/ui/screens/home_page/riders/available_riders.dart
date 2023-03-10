

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../data/models/parcel_description.dart';
import '../../../../data/models/riders.dart';
import '../../../widget/chosen_rider.dart';

class AvailableRidersScreen extends StatefulWidget {
  final String location;
  final String destination;

  final Parcel? parcel;

  const AvailableRidersScreen({
    Key? key,
    required this.location,
    required this.destination,
    required this.parcel
  }) : super(key: key);

  @override
  State<AvailableRidersScreen> createState() => _AvailableRidersScreenState();
}

class _AvailableRidersScreenState extends State<AvailableRidersScreen> {

  List<Riders> riders = [
    Riders(
        profilePics: 'woman_profile.jpg',
        fees: 4500,
        time: 45,
        vehicle: 'Truck',
        riderName: 'James'
    ),
    Riders(
        profilePics: 'fast_delivery.jpg',
        fees: 1200,
        time: 10,
        vehicle: 'Truck', riderName: 'Sam'
    ),
    Riders(
        profilePics: 'happy_customer.jpg',
        fees: 4500,
        time: 1,
        vehicle: 'Truck', riderName: 'Tony'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Text('Available Riders'),
        ),
        foregroundColor: signUpPageBackgroundColor,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Icon(Icons.notifications)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text('Connect to other app drivers?'),
        backgroundColor: primaryColor,
        icon: Icon(Icons.connect_without_contact),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: riders.length,
          itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.all(15.0),
           child: ChosenRider(
             rider: riders[index],
             destination: widget.destination,
             location: widget.location,
             parcel: widget.parcel
           ),
         );
      }
      )

    );
  }
}
