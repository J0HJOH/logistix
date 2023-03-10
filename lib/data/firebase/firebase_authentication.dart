import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../ui/screens/home_page/home_page.dart';
import '../../ui/screens/introductory_screens/log_in.dart';

class FireAuth {
  static Future<Object?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const weakSnackbar = SnackBar(
          content: Text('The password provided is too weak.'),);
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(weakSnackbar);
        print('The password provided is too weak.');

        return e.code;

      } else if (e.code == 'email-already-in-use') {
        const usedSnackbar = SnackBar(
          content: Text('The account already exists for that email.'),);
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
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBar usedSnackbar = SnackBar(
          content: Text('An Error Occurred ${e.toString()}. No user found for that email'),);
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(usedSnackbar);

        print('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        SnackBar usedSnackbar = SnackBar(
          content:
          Text('An Error Occurred ${e.toString()}. Wrong password provided'),);
        ScaffoldMessenger.of(context).showSnackBar(usedSnackbar);

        print('Wrong password provided.');
      }
    } catch (e){
      SnackBar usedSnackbar = SnackBar(
        content:
        Text('An Error Occurred ${e.toString()}. Please try again'),);
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(usedSnackbar);
    }

    return user;
  }

}

