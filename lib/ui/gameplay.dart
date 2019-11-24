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
    var charList = getWordsLetterList();

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
              'M _ _ _',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width - 40.0,
            child: Text(
              'Meaning:\nto produce; cause to exist or happen; bring about;',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 50.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50.0),
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: charList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.all(2.0),
                    color: Colors.amberAccent,
                    child: GestureDetector(
                      onTap: () {
                        debugPrint(charList[index]);
                      },
                      child: Text(charList[index]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  List<String> getWordsLetterList() {
    var charList = new List<String>();
    charList.add("M");
    charList.add("A");
    charList.add("K");
    charList.add("E");
    return charList;
  }

  Widget getListWidget() {
    var charList = getWordsLetterList();
    return Container(
      child: ListView.builder(
          itemCount: charList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 50.0,
              width: 50.0,
              color: Colors.amberAccent,
              child: GestureDetector(
                onTap: () {
                  debugPrint(charList[index]);
                },
                child: Center(
                  child: Text(
                    charList[index],
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
