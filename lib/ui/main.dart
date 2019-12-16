import 'package:Wordy/util/data_util.dart';
import 'package:flutter/material.dart';
import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

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

    setPreferences();

    Future.delayed(
      Duration(seconds: 3),
      () {
        //goto home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(false),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Wordy!",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor('444444')),
              ),
            ),
//            Align(
//                child: Container(
//              child: Text('developed by InvalidCo', style: TextStyle(fontSize: 10.0),),
//            ))
          ],
        ),
      ),
    );
  }

  void setPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    setAllListStringInSharedPreference();

    //just setup all the prefs data one time only after installing the app
    if (!prefs.containsKey('first_time')) {
      debugPrint('first_time: true');
      await prefs.setBool('first_time', false);
      setAllListStringInSharedPreference();
    } else {
      debugPrint('first_time: false');
    }
  }

  void setAllListStringInSharedPreference() async {
    List<Word> prepositionList = DataUtil.getPrepositionList();
    var prepositionListJson =
        jsonEncode(prepositionList.map((e) => e.toJson()).toList());
    String prepositionListString = prepositionListJson.toString();

    List<Word> positiveList = DataUtil.getPositiveWords();
    var positiveListJson =
        jsonEncode(positiveList.map((e) => e.toJson()).toList());
    String positiveListJsonString = positiveListJson.toString();

    List<Word> negativeList = DataUtil.getNegativeWords();
    var negativeListJson =
    jsonEncode(negativeList.map((e) => e.toJson()).toList());
    String negativeListJsonString = negativeListJson.toString();

    List<Word> emotionalList = DataUtil.getEmotionalWords();
    var emotionalListJson =
    jsonEncode(emotionalList.map((e) => e.toJson()).toList());
    String emotionalListJsonString = emotionalListJson.toString();

    List<Word> inspirationalList = DataUtil.getInspirationalWords();
    var inspirationalListJson =
    jsonEncode(inspirationalList.map((e) => e.toJson()).toList());
    String inspirationalListJsonString = inspirationalListJson.toString();

    List<Word> salesList = DataUtil.getSalesWords();
    var salesListJson =
    jsonEncode(salesList.map((e) => e.toJson()).toList());
    String salesListJsonString = salesListJson.toString();

    List<Word> businessList = DataUtil.getBusinessWords();
    var businessListJson =
    jsonEncode(businessList.map((e) => e.toJson()).toList());
    String businessListJsonString = businessListJson.toString();

    List<Word> complimentList = DataUtil.getComplimentWords();
    var complimentListJson =
    jsonEncode(complimentList.map((e) => e.toJson()).toList());
    String complimentListJsonString = complimentListJson.toString();

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('preposition', prepositionListString);
    await prefs.setString('positive', positiveListJsonString);
    await prefs.setString('negative', negativeListJsonString);
    await prefs.setString('emotional', emotionalListJsonString);
    await prefs.setString('inspirational', inspirationalListJsonString);
    await prefs.setString('sales', salesListJsonString);
    await prefs.setString('business', businessListJsonString);
    await prefs.setString('compliments', complimentListJsonString);

  }
}
