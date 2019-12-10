import 'package:Wordy/ui/home.dart';
import 'package:Wordy/util/data_util.dart';
import 'package:Wordy/util/dialogs.dart';
import 'package:Wordy/util/shared_preferences.dart';
import 'package:Wordy/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

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
  List<Word> wordList = [];
  String guessedWord = '';
  List<String> charList = [];
  int index = 0;
  Word preposition = new Word.empty();
  var isGeneratedNewList = true;
  String correctWord = '';
  String fillInTheBlankHint = '';
  String meaning = '';
  String placeholder_guessed_word = '';
  List<Word> list = [];
  var isLoaded = false;

  SharedPreferences prefes;

  bool isFirstLoading = true;

  _GamePlayPageState(Category category) {
    this.category = category;
    homeText = category.name;
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future loadJson() async {
    print('fetching words....');
//    WordyPreference.fetchListAsString(category.name.toLowerCase()).then((albums){
//      print('length: ${albums.length}');
//      print('first: ${albums[0].word}');
//    });
//
    prefes = await SharedPreferences.getInstance();
//    print(prefs.getString(category.name.toLowerCase()));

    WordyPreference.getString(category.name.toLowerCase()).then((string) {
      print(string);

      var myData = json.decode(string);
      for (var word in myData) {
//
        var stringId = '${word['id']}';
        int id = int.parse(stringId);
        wordList.add(new Word.Construct(id, '${word['word']}',
            '${word['meaning']}', '${word['fillInTheGapSentence']}'));
        debugPrint('${word['id']}');
        debugPrint('${word['word']}');
        debugPrint('${word['meaning']}');
        debugPrint('${word['fillInTheGapSentence']}');
      }

      setState(() {
        isLoaded = true;
      });
    });

    void testJson() {
      List<Word> l = DataUtil.getPrepositionList();
      List jsonList = Word.encondeToJson(l);
      var j = jsonEncode(l.map((e) => e.toJson()).toList());
      String jsonString = j.toString();

      debugPrint('$jsonString');

      var myData = json.decode(jsonString);

      debugPrint('$myData');
    }
  }

  void setCategoryList(String categoryName) {
    if (categoryName.toLowerCase() == Categories.preposition.toLowerCase()) {
      wordList = DataUtil.getPrepositionList();
    } else if (categoryName.toLowerCase() ==
        Categories.positive.toLowerCase()) {
      wordList = DataUtil.getPositiveWords();
    } else if(categoryName.toLowerCase() == Categories.negative.toLowerCase()) {
      wordList = DataUtil.getPrepositionList();
    } else {
      wordList = DataUtil.getPrepositionList();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      if (isFirstLoading) {
        isFirstLoading = false;

        var categoryName = category.name.toLowerCase();
        var indexSavingKey = categoryName + 'index';

        if (prefes.containsKey(indexSavingKey)) {
          //this will return last index of wordlist that user answered correct
          index = prefes.getInt(indexSavingKey);
          //just goto next word because saved last index was user answered correctly
          index++;
        }
      }

      preposition = wordList[index];
      totalScroe = wordList.length;

      if (isGeneratedNewList) {
        charList = getWordsLetterList(wordList[index].word);
        correctWord = preposition.word;
        fillInTheBlankHint = preposition.fillInTheGapSentence
            .replaceAll(correctWord, '________');
        isGeneratedNewList = false;
      }
      meaning = preposition.meaning;
    }

    return isLoaded
        ? Scaffold(
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
                          //do not go -1 index of word list cause that's impossible.
                          //there is no word
                          if (index != 0) {
                            gotoPreviousWord();
                            setState() {
                              index--;
                              isGeneratedNewList = true;
                            }
                          } else {
                            //show no previous word dialog
                            showWrongAnswerDialog('You can not go previous');
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
                      icon: Icon(Icons.arrow_forward_ios,
                          color: HexColor('#444444')),
                      onPressed: () {
                        setState(() {
                          var nextWordId = wordList[index].id.toString();
                          if (prefes.containsKey(nextWordId)) {
                            gotoNextWord();

                            setState() {
                              index++;
                              isGeneratedNewList = true;
                            }
                          } else {
                            showWrongAnswerDialog('can not go to next!');
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
                    '$index/$totalScroe',
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
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w500),
                        ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50.0),
                    width: MediaQuery.of(context).size.width - 40.0,
                    child: //Text(
                        //'Fill in the gap:\n $fillInTheBlankHint;',
                        //textAlign: TextAlign.center,
                        //),
                        RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Fill in the gap: ',
                          style: TextStyle(
                              color: HexColor('#444444'),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$fillInTheBlankHint',
                              style: TextStyle(
                                  color: HexColor('#444444'),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                                text: '\nMeaning: ',
                                style: TextStyle(
                                  color: HexColor('#444444'),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: '$meaning;',
                              style: TextStyle(
                                  color: HexColor('#444444'),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            )
                          ]),
                    )),
                Container(
                  height: 55.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50.0),
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: charList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                var tappedLetter = '$guessedWord${charList[i]}';
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
                                  charList[i],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        );
                      }),
                )
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: Text('No data found!'),
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
      print('correct ans word id: ${wordList[index].id.toString()}');
      prefes.setString(wordList[index].id.toString(), '');
      //set last index that user answered correctly
      var categoryName = category.name.toLowerCase();
      var indexSavingKey = categoryName + "index";
      prefes.setInt(indexSavingKey, index);
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
            context,
            '$guessedWord is a right guess!',
            '$meaning;',
            '$guessedWord: ',
            true);
        userScore++;
        gotoNextWord();
      });
    });
  }

  void showWrongAnswerDialog(String word) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        Dialogs.showCorrectAnswerDialog(
            context, '$word is wrong guess!', '$meaning', 'Meaning:', false);
        fillInTheBlankHint = preposition.fillInTheGapSentence
            .replaceAll(correctWord, '________');
        charList = getWordsLetterList(wordList[index].word);
        guessedWord = '';
      });
    });
  }
}

//    List<Word> words = await WordyPreference.fetchListAsString(category.name);
//
//    print('fetcing from preferences: length - ${words.length}');
//
//    for(int i=0; i<words.length; i++){
//      print('\n');
//      print(words[i].word);
////      print(word.id.toString());
//    }
//    print('fetching done!');
//
//  }

//  void setList() async {
//    List<Word> l = await WordyPreference.fetchListAsString(category.name);
//    list = l;
//  }

//    String wordListInString = json.encode(l);
//    List<Word> list = json.decode(myData);
////
//    for (var word in myData) {
//      debugPrint('\n');
//      debugPrint('${word['id']}');
//      debugPrint('${word['word']}');
//      debugPrint('${word['meaning']}');
//      debugPrint('${word['fillInTheGapSentence']}');
//    }

//    setCategoryList(category.name);
//
//    preposition = wordList[index];
//    totalScroe = wordList.length;

//    setList();
//    testJson();
//    fetchListAsString(category.name);

//  fetchListAsString(String categoryName) async {
//    final prefs = await SharedPreferences.getInstance();
//
//    if (prefs.containsKey('preposition')) {
//      debugPrint('Contains key');
//
//      var data = prefs.get('preposition') as String;
//      var myData = json.decode(data);
//
//      for (var word in myData) {
//
//        var stringId = '${word['id']}';
//        int id = int.parse(stringId);
//        wordList.add(new Word(id, '${word['word']}', '${word['meaning']}',
//            '${word['fillInTheGapSentence']}'));
////       debugPrint('${word['id']}');
////      debugPrint('${word['word']}');
////      debugPrint('${word['meaning']}');
////      debugPrint('${word['fillInTheGapSentence']}');
//      }
//    } else {
//      debugPrint('Not contains key');
//    }
//
//
//    for (var l in wordList) {
//      debugPrint(l.word);
//    }
//  }
