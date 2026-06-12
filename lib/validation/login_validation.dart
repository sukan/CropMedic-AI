import 'package:flutter/material.dart';

class LoginValidation extends StatefulWidget {
  @override
  _LoginValidationState createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  @override
  Widget build(BuildContext context) {
    //Method for validate Email Field
    String validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
          r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (value.isEmpty) {
        return 'Please enter the email address';
      } else if (!regex.hasMatch(value)) {
        return 'Invalid Email! Please Enter the Valid Email address';
      }
    }

    //Method for validate Password Field
    String validatePassword(String value) {
      if (value.isEmpty) {
        return ' Please enter the Password';
      } else if (value.length < 6) {
        return "Your password needs to be atleast 6 characters";
      }
    }
  }
}
