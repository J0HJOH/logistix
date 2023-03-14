import 'package:flutter/material.dart';
import 'package:logistix/constants/colors.dart';
import 'package:logistix/data/models/parcel_description.dart';
import 'package:logistix/ui/screens/home_page/home_send_parcel/send_package.dart';

import '../../data/models/riders.dart';

class ChosenRider extends StatefulWidget {
  final Riders rider;
  final String location;
  final String destination;
  final  String? description;
  final String category;

  const ChosenRider({Key? key,
    required this.location,
    required this.destination,
    required this.rider,
    required this.description,
    required this.category,}) : super(key: key);

  @override
  State<ChosenRider> createState() => _ChosenRiderState();
}

class _ChosenRiderState extends State<ChosenRider> {

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
        onPressed:(){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>
                  SendPackageScreen(
                      rider: widget.rider,
                    location: widget.location,
                    destination: widget.destination,
                    description: widget.description,
                    category: widget.category
                  )
              )
          );
        },
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        backgroundColor: Color(0xFFFFEDE1),
        side: BorderSide(
          color: primaryColor,
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image(
                  image: AssetImage(widget.rider.profilePics!),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

             Text(
               ' ${widget.rider.vehicle} \n  ${widget.rider.time} min away',
               style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 14
               ),
             ),

              Text(
                  '${widget.rider.fees} \n NGN',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
    );
  }
}
