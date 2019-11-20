import 'package:flutter/material.dart';
import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/utils.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: MyApp(),
      title: "Wordy!",
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //this is like onCreate() method in Android

    Future.delayed(
      Duration(seconds: 3),
      () {
        //goto home page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('8BFF74'),
      body: Center(
        child: Text(
          "Wordy!",
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: HexColor('444444')),
        ),
      ),
    );
  }
}
