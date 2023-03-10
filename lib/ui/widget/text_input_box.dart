import 'package:flutter/material.dart';
import 'package:logistix/data/firebase/firebase_authentication.dart';

import '../../constants/colors.dart';
import '../../data/firebase/validator.dart';

class TextInputBox extends StatefulWidget {
  final String textDescription;
   TextInputType textInputType;
   TextEditingController controller;
   bool isPasswordType;
  Widget? prefixIcon;
  String? myValidator;
  late final bool Visibility;

   TextInputBox({Key? key,
    required this.textDescription,
     required this.textInputType,
    required this.controller,
    required this.isPasswordType,
     required this.Visibility,
     required this.prefixIcon, this.myValidator
  }) : super(key: key);

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {




  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: widget.key,
        style: const TextStyle(
            color: Colors.black,
          fontSize: 17
        ),
        keyboardType: widget.textInputType,
        focusNode: FocusNode(canRequestFocus: true),
        controller: widget.controller,
        validator: (value) => widget.myValidator,
        onChanged: (value) => userInput = value,
        obscureText: widget.isPasswordType,
        enableSuggestions: widget.isPasswordType,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            prefixIconColor: widget.prefixIcon != null
                ? primaryColor
                : null,
            fillColor: Colors.grey[100],
            filled: true,
            hintText: widget.textDescription,
            hintStyle: TextStyle(fontSize: 14.0),
            border: InputBorder.none
        ),
      ),
    );
  }
}
