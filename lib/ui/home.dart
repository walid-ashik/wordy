import 'package:Wordy/ui/gameplay.dart';
import 'package:flutter/material.dart';
import 'package:Wordy/util/utils.dart';

class HomePage extends StatelessWidget {
  var userPoints = 17;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.dark,
        toolbarOpacity: 0.5,
        title: Text(
          "Categories",
          style: TextStyle(color: HexColor('#444444'), fontSize: 14.0),
        ),
        actions: <Widget>[
          Center(
            child: Text(
              "Point: $userPoints      ",
              style: TextStyle(
                  color: HexColor('#444444'),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      body: getCategoryListView(),
    );
  }

  List<Category> getCategories() {
    List<Category> categoires = new List();
    categoires.add(new Category("Preposition", "#FBCA93", true));
    categoires.add(new Category("Positive", "#A4FB93", false));
    categoires.add(new Category("Negative", "#7AFBF2", false));
    categoires.add(new Category("Emotional", "#7AA9FB", false));
    categoires.add(new Category("Inspirational", "#D487F9", false));
    categoires.add(new Category("Sales", "##F98787", false));
    categoires.add(new Category("Business", "#FBCA93", false));
    categoires.add(new Category("Compliements", "#A4FB93", false));
    return categoires;
  }

//  List<Category> getCategories() {
//    List<Category> categoires = new List();
//    categoires.add(new Category("Level 1", "#FBCA93", true));
//    categoires.add(new Category("Level 2", "#A4FB93", false));
//    categoires.add(new Category("Level 3", "#7AFBF2", false));
//    categoires.add(new Category("Level 4", "#7AA9FB", false));
//    categoires.add(new Category("Level 5", "#D487F9", false));
//    categoires.add(new Category("Level 6", "#F98787", false));
//    return categoires;
//  }

  Widget getCategoryListView() {
    var categories = getCategories();

    AssetImage lockImage = AssetImage('images/lock.png');

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePlayPage(category),
      ),
    );
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

//  Word(this.word, this.meaning, this.fillInTheGapSentence);
  Word.emtpy();

  Word(int id, String word, String meaning, String fillInTheGapSentence){
    this.id = id;
    this.word = word;
    this.meaning = meaning;
    this.fillInTheGapSentence = fillInTheGapSentence;
  }
}

