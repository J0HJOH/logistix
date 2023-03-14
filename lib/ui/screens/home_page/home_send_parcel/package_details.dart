import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logistix/ui/screens/home_page/home_send_parcel/send_package.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../data/models/parcel_description.dart';
import '../../../widget/button.dart';
import '../select_location_screen/select_location.dart';

class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({Key? key}) : super(key: key);

  get user => FirebaseAuth.instance.currentUser;  //check again

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  TextEditingController packageController  = TextEditingController();

  Parcel? myParcel;

  List<String> images = [
    'goods.png',
    'document.png',
    'edibles.png'
  ];

  List<String> imageName = [
    'Goods', 'Documents','Groceries'
  ];

  String? dropDownValue = 'Goods';


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
                  'Package Details',
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'evolventa'
                  ),
              ),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: signUpPageBackgroundColor,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.notifications,
                color: signUpPageBackgroundColor,
              )
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              alignment: Alignment.topLeft,
                child: const Text(
                    'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12
                  ),
                ),
            ),


            Container(
              height: 25.h,
              constraints: BoxConstraints(
                maxHeight: 25.h,
                minHeight: 23.h
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder:(context, index)=>
                    Column(
                      children: [
                        Container(
                          width: 40.w,
                          height: 20.h,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: customShadow,
                          ),
                          child: Image(
                            image: AssetImage(images[index]),
                            width: 40.w,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(imageName[index])
                      ],
                    )
              ),
            ),


            Container(
              margin: EdgeInsets.only(top:2.h),
              child: const Text(
                'Package Type',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  color: Colors.black
                ),
              ),
            ),

            SizedBox(height: 1.h,),

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
                  items: imageName.map<DropdownMenuItem<String>>((String value) {
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

            SizedBox(height: 4.h),

            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Package Description',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.black
                ),
              ),
            ),

            SizedBox(height: 1.h,),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle
                ),
                child: TextField(
                  cursorColor: primaryColor,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    letterSpacing: 2.0
                  ),
                  controller: packageController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Describe your package below',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
            ),

            SizedBox(height: 1.h,),
            
            Container(
              alignment: Alignment.bottomRight,
              child: Button(
                width: 15.w,
                buttonText: 'Next', 
                buttonColor: primaryColor, 
                onPressed: (){
                  setState(() {
                    myParcel?.category = dropDownValue!;
                    myParcel?.packageDescription = packageController.text;

                    if(dropDownValue != null ){
                      debugPrint('${myParcel?.packageDescription}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectLocation(
                                user: widget.user,
                                description:packageController.text,
                                category: dropDownValue!,
                              )
                          )
                      );
                    }else{
                      const mySnackbar = SnackBar(
                          content: Text('Please fill information'));
                      ScaffoldMessenger.of(context).showSnackBar(mySnackbar );
                    }
                  });
                },
                height: 3.h,
                txtcolor: Colors.white,
              ),
            )

          ],
        ),
      ),
    );
  }
}


