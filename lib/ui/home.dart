import 'package:flutter/material.dart';
import 'package:Wordy/util/utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getCategoryListView(),
    );
  }

  List<Category> getCategories() {
    List<Category> categoires = new List();
    categoires.add(new Category("Preposition", "#FBCA93"));
    categoires.add(new Category("Business", "#A4FB93"));
    categoires.add(new Category("Emotional", "#7AFBF2"));
    categoires.add(new Category("Positive", "#7AA9FB"));
    categoires.add(new Category("Sales", "#D487F9"));
    categoires.add(new Category("Negative", "#F98787"));
    return categoires;
  }

  Widget getCategoryListView() {
    var categories = getCategories();

    AssetImage lockImage = AssetImage('images/lock.png');

    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
              height: 120.0,
              child: GestureDetector(
                onTap: (){
                  debugPrint('tapped: ${categories[index].name}');
                },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0,
                      color: HexColor(categories[index].color),
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 7.5, bottom: 7.5),
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
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              Icon(Icons.lock,
                                  color: HexColor('#444444'), size: 20.0),
                              Text('   ')
                            ],
                          ),
                          Spacer(),
                        ],
                      ))));
        });
  }
}

class Category {
  String name;
  String color;

  Category(String name, String color) {
    this.name = name;
    this.color = color;
  }
}
