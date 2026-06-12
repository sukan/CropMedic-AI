import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/login.dart';


class DetectMain extends StatefulWidget {
  @override
  _DetectMainState createState() => new _DetectMainState();
}

class _DetectMainState extends State<DetectMain> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Appbar with heading and login button
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetectMain())),
        ),
        title: Text(
          "Crop Medic Plus 2.0",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
        backgroundColor: Colors.teal,
        centerTitle: false,
      ),

      // View of the main page
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:

            // Disorder description view
                <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 25, right: 14, top: 25, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: greeting(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              TextSpan(
                                  text: ' User!',
                                  style: TextStyle(
                                      fontFamily: 'ConcertOne-Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Browse and Detect the disorder in one click.'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "  Select or capture the plant leaf to predict disorder:",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ]),
              ),

      // Floating button for camera and gallery
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(color: Colors.white, size: 25),
        visible: dialVisible,
        curve: Curves.bounceInOut,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Toggle',
        heroTag: 'toggele-hero-tag',
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        overlayOpacity: 0.7,
        elevation: 10.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.camera,
                size: 24,
              ),
              backgroundColor: Colors.redAccent,
              label: 'Camera',
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              onTap: () => selectFromCamera()),
          SpeedDialChild(
              child: Icon(
                Icons.image,
                size: 24,
              ),
              backgroundColor: Colors.blueAccent,
              label: 'Gallery',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => selectFromGallery()),
        ],
      ),
    );
  }
}
