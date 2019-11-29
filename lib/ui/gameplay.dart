import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/data_util.dart';
import 'package:Wordy/util/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
  var prepositionList;
  String guessedWord = '';
  List<String> charList;
  var index = 0;
  Word preposition = new Word.emtpy();
  var isGeneratedNewList = true;
  String correctWord = '';
  String fillInTheBlankHint = '';

  _GamePlayPageState(Category category) {
    this.category = category;
    homeText = category.name;
    prepositionList = DataUtil.getPrepositionList();
    preposition = prepositionList[index];
  }

  @override
  Widget build(BuildContext context) {
    int selectedBottomItem = 0;
    if (isGeneratedNewList) {
      charList = getWordsLetterList(prepositionList[index].word);
      correctWord = preposition.word;
      fillInTheBlankHint =
          preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
      isGeneratedNewList = false;
    }

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
                    gotoPreviousWord();
                    setState() {
                      isGeneratedNewList = true;
                    }

                    debugPrint('previous clicked!');
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
                icon: Icon(Icons.arrow_forward, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    homeText = 'forward clicked';
                    debugPrint(homeText);
                    gotoNextWord();
                    setState() {
                      isGeneratedNewList = true;
                    }
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
              '$guessedWord',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width - 40.0,
            child: Text(
              'Fill in the gap:\n $fillInTheBlankHint;',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 55.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50.0),
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: charList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          var tappedLetter = '$guessedWord${charList[index]}';
                          setState(() {
                            guessedWord = tappedLetter;
                          });
                          debugPrint('clicked');
//                        debugPrint(charList[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 55.0,
                          margin: EdgeInsets.all(2.0),
                          color: HexColor('#EEEEEE'),
                          child: Text(
                            charList[index],
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }

  void gotoNextWord() {
    guessedWord = '';
    index = index + 1;
    preposition = prepositionList[index];
    correctWord = preposition.word;
    fillInTheBlankHint =
        preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
    charList = getWordsLetterList(prepositionList[index].word);
  }

  void gotoPreviousWord() {
    guessedWord = '';
    index = index - 1;
    preposition = prepositionList[index];
    correctWord = preposition.word;
    fillInTheBlankHint =
        preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
    charList = getWordsLetterList(prepositionList[index].word);
  }

  List<String> getWordsLetterList(String word) {
    var charList = new List<String>();

    for (int i = 0; i < word.length; i++) {
      charList.add(word[i].toUpperCase());
    }
    charList.shuffle();

    return charList;
  }
}
