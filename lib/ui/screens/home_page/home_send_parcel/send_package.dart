import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../data/models/parcel_description.dart';
import '../../../../data/models/riders.dart';
import '../../../widget/button.dart';
import '../../../widget/text_input_box.dart';
import '../../history_page/summary.dart';

class SendPackageScreen extends StatefulWidget {
  final Riders rider;
  final String location;
  final String destination;
  final Parcel? parcel;
  const SendPackageScreen({
    Key? key, required this.rider,
    required this.location,
    required this.destination,
    required this.parcel,
  }) : super(key: key);

  @override
  State<SendPackageScreen> createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  TextEditingController senderName = TextEditingController();
  TextEditingController receiverName = TextEditingController();
  TextEditingController receiverNumber = TextEditingController();
  TextEditingController itemNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
              'Send Package'
          ),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 17,
          color: Colors.black
        ),
        centerTitle: true,
        foregroundColor: signUpPageBackgroundColor,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications)
          )
        ],
       elevation: 0.0,titleSpacing: 2.0,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('From'),
            ),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextInputBox(
                  textDescription: 'Name',
                  textInputType: TextInputType.name,
                  controller: senderName,
                  isPasswordType: false,
                  Visibility: true,
                  prefixIcon: null,
                ),
              ),
            ),

            SizedBox(height: 2.h,),

            Container(
              child: Text('To'),
            ),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor)
                ),
                child: TextInputBox(
                  textDescription: 'Name',
                  textInputType: TextInputType.name,
                  controller: receiverName,
                  isPasswordType: false,
                  Visibility: true,
                  prefixIcon: null,
                ),
              ),
            ),

            SizedBox(height: 2.h,),

            Container(
              child: Text('Phone'),
            ),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor)
                ),
                child: TextInputBox(
                  textDescription: '+234 ',
                  textInputType: TextInputType.phone,
                  controller: receiverNumber,
                  isPasswordType: false,
                  Visibility: true,
                  prefixIcon: null,
                ),
              ),
            ),


            SizedBox(height: 2.h,),

            Container(
              child: Text('Total item'),
            ),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor)
                ),
                child: TextInputBox(
                  textDescription: '1 ',
                  textInputType: TextInputType.number,
                  controller: itemNumber,
                  isPasswordType: false,
                  Visibility: true,
                  prefixIcon: Icon(Icons.card_giftcard),
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            Container(
              constraints: BoxConstraints(
                maxWidth: 90.w,
                maxHeight: 8.h
              ),
              child: ElevatedButton(
                onPressed: (){
                  widget.parcel?.itemNumber = int.parse(receiverNumber.text);

                 if(senderName!= null
                     || receiverNumber!= null
                     || receiverName!= null|| itemNumber != null){
                   debugPrint(widget.destination,);
                   debugPrint(widget.location);
                   debugPrint(widget.parcel as String?);
                   debugPrint(widget.rider as String?);

                  Navigator.push(
                       context, MaterialPageRoute(
                     builder: (context) => SummaryScreen(
                       senderName: senderName.text,
                       recieverName: receiverName.text,
                       recieverNum: int.parse(receiverNumber.text),
                       destination: widget.destination,
                       parcel: widget?.parcel,
                       rider: widget.rider,
                       senderLocation: widget.location,
                     ),
                   )
                   );
                 }else{
                   const snackBar = SnackBar(
                       content: Text('Please fill fields Correctly'));
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Generate Tracking Id'),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: primaryColor,
                  elevation: 20,
                  foregroundColor: Colors.white,
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
