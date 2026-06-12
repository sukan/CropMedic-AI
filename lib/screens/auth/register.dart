import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cropmedic/validation/register_validation.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email, _password, _cpassword, _username;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login())),
        ),
        title: Text(
          "Crop Medic Plus 2.0",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.teal,
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 45,
              ),
              Image(
                image: AssetImage("assets/icon.PNG"),
                height: 180,
              ),
              SizedBox(
                height: 0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  labelText: "Username",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                ),
                validator: validateUsername,
                autovalidate: false,
                onSaved: (input) => _username = input,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  labelText: "Email ID",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                ),
                validator: validateEmail,
                autovalidate: false,
                onSaved: (input) => _email = input,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validatePassword,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validatePassword,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  labelText: "Confirm Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: 380,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.teal)),
                    onPressed: signUp,
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: Text("Sign UP".toUpperCase(),
                        style: TextStyle(fontSize: 17)),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 95,
                    ),
                    Text(
                      'Already have an account ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Firebase Authentication
  Future<void> signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult auth = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: 'You have successfully Registered');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
