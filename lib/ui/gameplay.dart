import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/utils.dart';
import 'package:flutter/material.dart';

class GamePlayPage extends StatefulWidget {
  final Category category;

  GamePlayPage(this.category) : super();

  @override
  _GamePlayPageState createState() => _GamePlayPageState(category);
}

class _GamePlayPageState extends State<GamePlayPage> {
  Category category;
  var homeText = "";
  var userScore = 3;
  var totalScroe = 10;

  _GamePlayPageState(Category category) {
    this.category = category;
    homeText = category.name;
  }

  @override
  Widget build(BuildContext context) {
    int selectedBottomItem = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: HexColor('${category.color}'),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: HexColor('#444444'),
                ),
                onPressed: () {
                  setState(() {
                    homeText = 'back clicked';
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    homeText = 'forward clicked';
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.refresh, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    homeText = 'reload clicked';
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.check, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    homeText = 'check clicked';
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 80.0),
            child: Text(
              '$userScore/$totalScroe',
              style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#D5D5D5')),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100.0),
            child: Text(
              'M A K E',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width - 40.0,
            child: Text(
              'Meaning:\nto produce; cause to exist or happen; bring about;',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
