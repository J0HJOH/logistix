import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  TextEditingController _accountName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text('Payment Method'),
        ),
        centerTitle: true,
        foregroundColor: signUpPageBackgroundColor,
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.notifications)
        ],
      ),

      body: Column(
        children: [
          Container(
            child: Text('Enter your card details'),
          ),

          Material(
            elevation: 0.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 10.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: signUpPageBackgroundColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle
              ),
              child: TextField(
                cursorColor: primaryColor,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    letterSpacing: 2.0
                ),
                controller: _accountName,
                keyboardType: TextInputType.name,
                maxLines: 1,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
