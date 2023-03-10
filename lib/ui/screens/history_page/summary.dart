import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../data/models/parcel_description.dart';
import '../../../data/models/riders.dart';

class SummaryScreen extends StatefulWidget {
  final String senderName;
  final String recieverName;
  final num recieverNum;
  final String senderLocation;
  final String destination;
  final Riders rider;
  final Parcel? parcel;
  const SummaryScreen({
    Key? key,
    required this.senderName,
    required this.recieverName,
    required this.recieverNum,
    required this.senderLocation,
    required this.destination,
    required this.rider, required this.parcel}
      ) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  String dropDownValue = '';


  @override
  Widget build(BuildContext context) {

    Parcel myParcel =widget.parcel!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        actions: [
          Icon(Icons.notifications)
        ],
        backgroundColor: Colors.white,
        foregroundColor: signUpPageBackgroundColor,

      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Package Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                    myParcel.category,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Delivery Time',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                  '${widget.rider.time} mins away',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Receivers Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                    widget.recieverName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Receivers Phone No.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                  '${widget.recieverNum}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Drivers Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                    widget.rider.riderName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Drivers Phone No',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                    '07033143687',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Total Amount',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                ),
                Text(
                    '# ${widget.rider.fees}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                ),

                SizedBox(height: 5.h,),

                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    child: DropdownButtonFormField<String>(
                      borderRadius: BorderRadius.circular(20),
                      hint: Text('Select category'),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: signUpPageBackgroundColor,
                      ),
                      // Step 3.
                      value: dropDownValue,
                      elevation: 20,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none
                      ),
                      items: ['Credit Card',' Debit Card', 'Cash']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 2.h,),

                ElevatedButton(
                    onPressed: (){},
                    child: Text('Pay Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    alignment: Alignment.bottomLeft,
                    fixedSize: Size(80.w, 3.h),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
