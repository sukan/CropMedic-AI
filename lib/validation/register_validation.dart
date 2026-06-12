import 'package:flutter/material.dart';

class RegisterValidation extends StatefulWidget {
  @override
  _RegisterValidationState createState() => _RegisterValidationState();
}

class _RegisterValidationState extends State<RegisterValidation> {
  @override
  Widget build(BuildContext context) {

    //Email Validation
    String validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]'
          r'{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (value.isEmpty) {
        return 'Please enter the email address';
      } else if (!regex.hasMatch(value)) {
        return 'Invalid Email! Please Enter the Valid Email address';
      }
      return null;
    }

    //Password Validation
    String validatePassword(String value) {
      if (value.isEmpty) {
        return ' Please enter the Password';
      } else if (value.length < 6) {
        return "Your password needs to be atleast 6 characters";
      }
      return null;
    }

    //Mobile No Validation
    String validateMobile(String value) {
      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(patttern);
      if (value.length == 0) {
        return 'Please enter mobile number';
      }
      else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
      return null;
    }

    //Username validation
    String validateUsername(String value) {

      if (value.isEmpty) {
        return 'Please enter Username';
      }
      return null;
    }

  }
}
