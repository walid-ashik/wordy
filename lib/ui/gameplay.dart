import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/data_util.dart';
import 'package:Wordy/util/dialogs.dart';
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
  var userScore = 1;
  var totalScroe = 0;
  var wordList;
  String guessedWord = '';
  List<String> charList;
  var index = 0;
  Word preposition = new Word.emtpy();
  var isGeneratedNewList = true;
  String correctWord = '';
  String fillInTheBlankHint = '';
  String meaning = '';
  String placeholder_guessed_word = '';

  _GamePlayPageState(Category category) {
    this.category = category;
    homeText = category.name;
    setCategoryList(category.name);
    preposition = wordList[index];
    totalScroe = wordList.length;
  }

  void setCategoryList(String categoryName) {
    if (categoryName.toLowerCase() == Categories.preposition.toLowerCase()) {
      wordList = DataUtil.getPrepositionList();
    } else if (categoryName.toLowerCase() ==
        Categories.positive.toLowerCase()) {
      wordList = DataUtil.getPositiveWords();
    } else {
      wordList = DataUtil.getPrepositionList();
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedBottomItem = 0;
    if (isGeneratedNewList) {
      charList = getWordsLetterList(wordList[index].word);
      correctWord = preposition.word;
      fillInTheBlankHint =
          preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
      isGeneratedNewList = false;
    }
    meaning = preposition.meaning;

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
                  Icons.arrow_back_ios,
                  color: HexColor('#444444'),
                ),
                onPressed: () {
                  setState(() {
                    gotoPreviousWord();
                    userScore--;
                    setState() {
                      isGeneratedNewList = true;
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.autorenew, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    guessedWord = '';
                    charList = getWordsLetterList(wordList[index].word);
                    setState() {
                      isGeneratedNewList = true;
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: HexColor('#444444')),
                onPressed: () {
                  setState(() {
                    homeText = 'forward clicked';
                    debugPrint(homeText);
                    gotoNextWord();
                    userScore++;
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
            child: guessedWord == ''
                ? Text(
                    '$placeholder_guessed_word ',
                    style: TextStyle(
                        color: HexColor('#D5D5D5'),
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500),
                  )
                : Text(
                    '$guessedWord',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500),
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
                          checkAnswer(meaning);
//                        debugPrint(charList[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 55.0,
                          margin: EdgeInsets.all(2.0),
                          color: HexColor('${category.color}'),
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
    preposition = wordList[index];
    correctWord = preposition.word;
    fillInTheBlankHint =
        preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
    charList = getWordsLetterList(wordList[index].word);
  }

  void gotoPreviousWord() {
    guessedWord = '';
    index = index - 1;
    preposition = wordList[index];
    correctWord = preposition.word;
    fillInTheBlankHint =
        preposition.fillInTheGapSentence.replaceAll(correctWord, '________');
    charList = getWordsLetterList(wordList[index].word);
  }

  List<String> getWordsLetterList(String word) {
    var charList = new List<String>();

    //make empty placeholder first otherwise it's keep adding every time new '_'
    placeholder_guessed_word = '';

    for (int i = 0; i < word.length; i++) {
      charList.add(word[i].toUpperCase());
      //set each letter for each dash as placholder
      placeholder_guessed_word += ' _';
    }
    charList.shuffle();

    return charList;
  }

  void checkAnswer(String meaning) {
    debugPrint('$guessedWord != $correctWord');
    if (guessedWord.toLowerCase() == correctWord.toLowerCase()) {
      debugPrint("Answer is correct");
      showCorrectAnswerDialog(meaning);
    } else {
      debugPrint("Wrong answer");
      //only show this dialog when user typed all possible letters
      if (correctWord.length == guessedWord.length) {
        showWrongAnswerDialog(guessedWord);
      }
    }
  }

  void showCorrectAnswerDialog(String meaning) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        Dialogs.showCorrectAnswerDialog(
            context, '$guessedWord is a right guess!', '$meaning;', '$guessedWord: ');
        userScore++;
        gotoNextWord();
      });
    });
  }

  void showWrongAnswerDialog(String word) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        Dialogs.showCorrectAnswerDialog(
            context, '$word is wrong guess!', '$meaning', 'Meaning:');
        fillInTheBlankHint = preposition.fillInTheGapSentence
            .replaceAll(correctWord, '________');
        charList = getWordsLetterList(wordList[index].word);
        guessedWord = '';
      });
    });
  }
}
