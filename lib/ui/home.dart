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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
  var userPoints = 17;
  bool isComingFromNewPage;
  _HomePageState(bool isComingFromNewPage){
    this.isComingFromNewPage = isComingFromNewPage;
  }

  @override
  void initState() {
    super.initState();
    getUserPoint();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      //reload user point
      getUserPoint();
    }

    print('user state: $state');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(isComingFromNewPage) {
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

    if(prefes.containsKey(Constant.USER_POINT_KEY)){
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
