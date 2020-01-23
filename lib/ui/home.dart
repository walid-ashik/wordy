import 'package:Wordy/ui/gameplay.dart';
import 'package:Wordy/util/constant.dart';
import 'package:Wordy/util/data_util.dart';
import 'package:flutter/material.dart';
import 'package:Wordy/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  bool isComingFromNextPage = false;

  HomePage(this.isComingFromNextPage) : super();

  @override
  State<StatefulWidget> createState() => _HomePageState(isComingFromNextPage);
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  var userPoints = 17;
  bool isComingFromNewPage;
  double _contentFontSize = 0;

  _HomePageState(bool isComingFromNewPage) {
    this.isComingFromNewPage = isComingFromNewPage;
  }

  @override
  void initState() {
    super.initState();
    getUserPoint();
    WidgetsBinding.instance.addObserver(this);
    showRatingDialog();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      //reload user point
      getUserPoint();
      showRatingDialogIfUserScoredAtLeasetFivePoints();
    }

    print('user state: $state');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (isComingFromNewPage) {
      getUserPoint();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.dark,
        toolbarOpacity: 0.5,
        title: Text(
          "Categories",
          style: TextStyle(
              color: HexColor('#444444'),
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Center(
              child: RichText(
            text: TextSpan(
                text: 'Your Point: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: '$userPoints     ',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          ))
        ],
      ),
      body: getCategoryListView(),
    );
  }

  List<Category> getCategories() {
    List<Category> categoires = new List();
    categoires.add(new Category(Categories.preposition, "#FBCA93", true));
    categoires.add(new Category(Categories.positive, "#A4FB93", false));
    categoires.add(new Category(Categories.negative, "#7AFBF2", false));
    categoires.add(new Category(Categories.emotional, "#7AA9FB", false));
    categoires.add(new Category(Categories.inspirational, "#D487F9", false));
    categoires.add(new Category(Categories.sales, "##F98787", false));
    categoires.add(new Category(Categories.business, "#FBCA93", false));
    categoires.add(new Category(Categories.compliments, "#A4FB93", false));
    return categoires;
  }

  Widget getCategoryListView() {
    var categories = getCategories();

    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
              height: 120.0,
              child: GestureDetector(
                  onTap: () {
                    //goto home page
                    gotoGamePlay(context, categories[index]);

                    debugPrint('tapped: ${categories[index].name}');
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0,
                      color: HexColor(categories[index].color),
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 0.0, bottom: 15.0),
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                                color: HexColor('#444444'),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              categories[index].isCompleted
                                  ? Text('')
                                  : Icon(Icons.lock,
                                      color: HexColor('#444444'), size: 16.0),
                              Text('   ')
                            ],
                          ),
                          Spacer(),
                        ],
                      ))));
        });
  }

  void gotoGamePlay(BuildContext context, Category category) {
    //goto home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GamePlayPage(category),
      ),
    );
  }

  getUserPoint() async {
    var prefes = await SharedPreferences.getInstance();

    if (prefes.containsKey(Constant.USER_POINT_KEY)) {
      setState(() {
        userPoints = prefes.getInt(Constant.USER_POINT_KEY);
        print('user point: $userPoints');
      });
    } else {
      setState(() {
        userPoints = 0;
      });
    }
  }

  void showRatingDialogIfUserScoredAtLeasetFivePoints() async {
    //check first if user ticked remind me later
    //if user closes then do not show the dialog again
    var prefes = await SharedPreferences.getInstance();

    if (prefes.getBool('user_selected_remind_me_later')) {
      //show dialog again
      return;
    }

    if (prefes.getBool('user_closed_dialog')) {
      //set user selects remind me later to FALSE
      //
      return;
    }

    if (userPoints > 4) {
      //show dialog
      //and remember user preferences

    }

//    showRatingDialog();
  }

  void showRatingDialog() async {
    //need to wait few seconds otherwise showDialog() can't be called inside
    //initState method
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              return Dialog(
                child: Container(
                  height: 350,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.only(top: 40.0),
                          child: Image.asset(
                            'images/smile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text('Do you like the app?',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                          child: Text(
                            'Use the slider to tell it in the\nin the language of emojis.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Slider.adaptive(
                        value: 1,
                        onChanged: (newRating) {
                          stateSetter(() {
                            _contentFontSize = newRating;
                          });
                          setState(() {
                            _contentFontSize = newRating;
                          });
                        },
                        min: 0.0,
                        max: 2.0,
                        label: '$_contentFontSize',
                      ),
                      Expanded(
                        child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        color: Colors.blue[400],
                                        child: Center(
                                            child: Text(
                                          'DISMISS',
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        color: Colors.blue,
                                        child: Center(
                                            child: Text('SUBMIT',
                                                style: TextStyle(
                                                    color: Colors.white)))),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }
          );
        });
  }
}

class Category {
  String name;
  String color;
  bool isCompleted;

  Category(this.name, this.color, this.isCompleted);
}

class Word {
  int id;
  String word;
  String meaning;
  String fillInTheGapSentence;

  Word.Construct(
      int id, String word, String meaning, String fillInTheGapSentence) {
    this.id = id;
    this.word = word;
    this.meaning = meaning;
    this.fillInTheGapSentence = fillInTheGapSentence;
  }

//  Word(this.word, this.meaning, this.fillInTheGapSentence);
  Word.empty();

  Word({this.id, this.word, this.meaning, this.fillInTheGapSentence});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "word": this.word,
      "meaning": this.meaning,
      "fillInTheGapSentence": this.fillInTheGapSentence
    };
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      fillInTheGapSentence: json['fillInTheGapSentence'] as String,
    );
  }

  static List encondeToJson(List<Word> list) {
    List jsonList = List();
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }
}
