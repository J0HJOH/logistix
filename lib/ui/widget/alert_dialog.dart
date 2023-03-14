import 'package:flutter/material.dart';

class AlertDialogBox extends AlertDialog{
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AlertDialog(
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
        )
    );
  }
}
