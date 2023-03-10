import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logistix/data/firebase/firebase_authentication.dart';

import '../../../constants/colors.dart';
import '../../../data/firebase/validator.dart';
import '../../widget/button.dart';
import '../../widget/text_input_box.dart';
import '../home_page/home_page.dart';
import '../introductory_screens/sign_in.dart';

class LogInPageDetails extends StatefulWidget {
  const LogInPageDetails({Key? key,}) : super(key: key);


  
  

  @override
  State<LogInPageDetails> createState() => _LogInPageDetailsState();
}

class _LogInPageDetailsState extends State<LogInPageDetails> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          
          Container(
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20.0,
                  top: 50.0,
                  right: 8.0),
              child: Text(
                "Welcome Back \n Login to continue",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19
                ),
              ),
            ),
          ),

          TextInputBox(
            textDescription: 'Email',
            textInputType: TextInputType.emailAddress,
            controller: _emailTextController,
            isPasswordType: false,
            Visibility: true,
            prefixIcon: null,
            myValidator: Validator.validateEmail(
                email: _emailTextController.text),
          ),

          const SizedBox(
            height: 30,
          ),

          TextInputBox(
            textDescription: 'Password',
            textInputType: TextInputType.visiblePassword,
            controller: _passwordTextController,
            isPasswordType: true,
            Visibility: true,
            prefixIcon: null,
            myValidator: Validator.validatePassword(
                password: _passwordTextController.text
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          Button(
              width: 100,
              buttonText: "Get Started",
              buttonColor: Color(0xFFFF8134),
              onPressed: () async {
                User? user;
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
               try{
                 UserCredential loggedUser =  await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: _emailTextController.text,
                     password: _passwordTextController.text,
                 );
                 user = loggedUser.user;
                 user = FirebaseAuth.instance.currentUser;

                 if(loggedUser != null){
                   Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                           builder: (context) => HomePage(user: user!)
                       )
                   );
                 }
               } on FirebaseAuthException catch (e){
                 if (e.code == 'user-not-found') {
                   SnackBar usedSnackbar = SnackBar(
                     content: Text('An Error Occurred ,No user found for that email'),
                   );
                   ScaffoldMessenger.of(context as BuildContext)
                       .showSnackBar(usedSnackbar);

                   print('No user found for that email.');
                 }else if (e.code == 'wrong-password') {
                   SnackBar usedSnackbar = SnackBar(
                     content:
                     Text('An Error Occurred , Wrong password provided'),
                   );
                   ScaffoldMessenger.of(context)
                       .showSnackBar(usedSnackbar);

                   print('Wrong password provided.');
                 }
               } catch (e){
                 SnackBar usedSnackbar = SnackBar(
                   content:
                   Text('An Error Occurred ${e.toString()}. Please try again'),);
                 ScaffoldMessenger.of(context as BuildContext).showSnackBar(usedSnackbar);
               }


              },
              height: 30,
              txtcolor: Colors.white
          ),
          
          SizedBox(height: 50,),

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
                "Sign up with",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  fontFamily: 'Poppins'
                ),
              ),
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                    child: Image(
                        image: AssetImage('facebook_logo.png')
                    )
                ),
                SizedBox(width: 10,),
                GestureDetector(
                    child: Image(image: AssetImage('google_logo_design.png'))),
                SizedBox(width: 5.0,),
                GestureDetector(child:
                  Image(image: AssetImage('twitter_logo.png'))
             ),

              ],
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        letterSpacing: 2.0
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> SignInPage()));
                      },
                      child: Text(
                          'Sign up',
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
