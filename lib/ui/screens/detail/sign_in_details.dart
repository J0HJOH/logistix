import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../data/firebase/firebase_authentication.dart';
import '../../../data/firebase/validator.dart';
import '../../widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widget/text_input_box.dart';
import '../introductory_screens/log_in.dart';

class SignInPageDetail extends StatefulWidget {
  const SignInPageDetail({Key? key}) : super(key: key);

  @override
  State<SignInPageDetail> createState() => _SignInPageDetailState();
}

class _SignInPageDetailState extends State<SignInPageDetail> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();

    String? _emailvalidate = Validator.validateEmail(
        email: _emailTextController.text
    );

    String? _nameValidate = Validator.validateName(
        name: _nameTextController.text
    );

    String? _passworddValidate = Validator.validateName(
        name: _passwordTextController.text
    );


    return  Column(
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.only(bottom: 50.0,
              top: 10.0,
              right: 8.0),
              child: Text(
                "Create your account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19
                ),
              ),
            ),
          ),

           TextInputBox(
            textDescription: 'Name',
            textInputType: TextInputType.text,
             controller: _nameTextController,
             isPasswordType: false,
             Visibility: true,
             prefixIcon: null,
             myValidator: _nameValidate,
          ),

          const SizedBox(
            height: 30,
          ),
           TextInputBox(
            textDescription: 'Email',
            textInputType: TextInputType.emailAddress,
             controller: _emailTextController,
             isPasswordType: false,
             Visibility: true,
             prefixIcon: null,
             myValidator: _emailvalidate,
          ),

          const SizedBox(
            height: 30,
          ),

           TextInputBox(
            textDescription: 'Password',
            textInputType: TextInputType.visiblePassword,
             controller: _passwordTextController,
             isPasswordType: true, Visibility: true,
             prefixIcon: null,
             myValidator: _passworddValidate,
          ),

          const SizedBox(
            height: 30,
          ),

          Button(
              width: 100,
              buttonText: "Get Started",
              buttonColor: Color(0xFFFF8134),
              onPressed: () async {
                if(
                _emailTextController.text ==''||
                    _nameTextController.text == '' ||
                    _passwordTextController.text ==''
                ){
                  const emptySnackBar = SnackBar(content:
                  Text('Please input correct format in each fields')
                  );
                  ScaffoldMessenger.of(context).showSnackBar(emptySnackBar);
                }else if(_passwordTextController.text.length <=6
                    || _passwordTextController.text.contains(RegExp(r'[A-Z]'))
                ){
                  const passwordSnackBar = SnackBar(content:
                  Text('Password must contain capital '
                      'letter and be more than 6 characters')
                  );
                  ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);

                }else{
                  FirebaseAuth auth = FirebaseAuth.instance;
                  User? user;
                  try {
                    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    user = userCredential.user;
                    await user!.updateDisplayName(_nameTextController.text);
                    await user.reload();
                    user = auth.currentUser;

                   if(user != null){
                     const successSnackbar = SnackBar(
                       content: Text('Account created successfully, Please log in.'),
                     );
                     ScaffoldMessenger.of(context as BuildContext).showSnackBar(successSnackbar);
                     Navigator.push(context,
                         MaterialPageRoute(
                             builder: (context) => LogInPage())
                     );
                   }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      const weakSnackbar = SnackBar(
                        content: Text('The password provided is too weak.'),
                      );
                      ScaffoldMessenger.of(context as BuildContext).showSnackBar(weakSnackbar);
                      print('The password provided is too weak.');

                      return e.code;

                    } else if (e.code == 'email-already-in-use') {
                      const usedSnackbar = SnackBar(
                        content: Text('The account already exists for that email.'),
                      );
                      ScaffoldMessenger.of(context as BuildContext).showSnackBar(usedSnackbar);
                      print('The account already exists for that email.');

                      return e.code;
                    }
                  } catch (e) {
                    SnackBar usedSnackbar = SnackBar(
                      content: Text('An Error Occurred ${e.toString()}. Please try again'),);
                    ScaffoldMessenger.of(context as BuildContext).showSnackBar(usedSnackbar);
                    print(e);

                    return e;
                  }
                }
              },
              height: 30,
              txtcolor: Colors.white
          ),

          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 120,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0, height: 50,)
              ),
              Text('Or'),
              SizedBox(
                  width: 130,
                  child: Divider(
                    color: Colors.black,
                    height: 10, thickness:2.0,
                  )
              ),
            ],
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Sign Up with",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2.0,
                    color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 // IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                GestureDetector(child: Image(image: AssetImage('facebook_logo.png'))),
                SizedBox(width: 10,),
                GestureDetector(child: Image(image: AssetImage('google_logo_design.png'))),
                SizedBox(width: 10,),
                GestureDetector(child: Image(image: AssetImage('twitter_logo.png')))
              ],
            ),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Already have an account?',
                    style: TextStyle(
                        color: Colors.white,
                      fontFamily: 'Poppins',
                      letterSpacing: 2.0
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> LogInPage())
                        );
                      },
                      child: Text(
                        'Log in',
                        style:  TextStyle(
                            color: primaryColor,
                          fontFamily: 'Poppins',
                            letterSpacing: 2.0
                        )
                      ))
                ],
              ),
            ),
          )


    ]
    );
  }
}

