import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logistix/ui/screens/home_page/home_page.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../data/models/parcel_description.dart';
import '../../../data/models/riders.dart';
import '../../widget/alert_dialog.dart';
import '../home_page/home_send_parcel/payment_screen.dart';

class SummaryScreen extends StatefulWidget {
  final String senderName;
  final String recieverName;
  final num recieverNum;
  final String senderLocation;
  final String destination;
  final Riders rider;
  final String? description;
  final int itemNumber;
  final String category;

  const SummaryScreen({
    Key? key,
    required this.senderName,
    required this.recieverName,
    required this.recieverNum,
    required this.senderLocation,
    required this.destination,
    required this.rider,
    required this.description,
    required this.itemNumber,
    required this.category}
      ) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {


  @override
  void initState() {

    showAlertDialog();
    super.initState();
  }

  String dropDownValue = 'Cash';

  List<String> menuItem = ['Credit Card',' Debit Card', 'Cash'];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications)
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: signUpPageBackgroundColor,

      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    '${widget.category}',
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
              ],
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
                  hint: Text('Card Type'),
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
                  items:
                  menuItem.map<DropdownMenuItem<String>>((String value) {
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
              onPressed: (){
                if(dropDownValue == 'Cash'){
                  const  snackBar = SnackBar(
                      content:
                      Text('Order is confirmed, Package would be delivered soon')
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                }else{
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => PaymentMethod())
                  );
                }
              },
              child: Text('Pay Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                fixedSize: Size(80.w, 8.h),
              ),
            )
          ],
        ),
      ),

       // Future showDialog<void>(
       //    context: context,
       //    barrierDismissible: false,
       //    // false = user must tap button, true = tap outside dialog
       //    builder: (BuildContext dialogContext) {
       //      return AlertDialog(
       //        title: Text('title'),
       //        content: Text('dialogBody'),
       //        actions: <Widget>[
       //          TextButton(
       //            child: Text('buttonText'),
       //            onPressed: () {
       //              Navigator.of(dialogContext).pop(); // Dismiss alert dialog
       //            },
       //          ),
       //        ],
       //      );
       //    },
       //  );
    );
  }

  AlertDialog showAlertDialog() {
   return AlertDialog(
      title: Text('Welcome'),           // To display the title it is optional
      content: Text('GeeksforGeeks'),   // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
        ElevatedButton(
          onPressed: () {},             // function used to perform after pressing the button
          child: Text('CANCEL'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('ACCEPT'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
          ),
        ),
      ],
    );
  }
}
