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

  _GamePlayPageState(Category category) {
    this.category = category;
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
                icon: Icon(Icons.arrow_back, color: HexColor('#444444'),),
                onPressed: () {
                  debugPrint('clicked');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: HexColor('#444444')),
                onPressed: () {
                  debugPrint('clicked2');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.refresh, color: HexColor('#444444')),
                onPressed: () {
                  debugPrint('clicked3');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.check, color: HexColor('#444444')),
                onPressed: () {
                  debugPrint('clicked4');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('${category.name}'),
      ),
    );
  }
}

//BottomNavigationBar(
//currentIndex: 0,
//onTap: (int index) {
////          setState(() {
////            selectedBottomItem = index;
////          });
//},
//items: [
//BottomNavigationBarItem(
//backgroundColor:HexColor('${category.color}'),
//icon: Icon(
//Icons.arrow_back,
//color: HexColor('#444444'),
//),
//title: Text('')),
//BottomNavigationBarItem(
//backgroundColor:HexColor('${category.color}'),
//icon: Icon(
//Icons.arrow_forward,
//color: HexColor('#444444'),
//),
//title: Text('')),
//BottomNavigationBarItem(
//backgroundColor:HexColor('${category.color}'),
//icon: Icon(
//Icons.refresh,
//color: HexColor('#444444'),
//),
//title: Text('')),
//BottomNavigationBarItem(
//backgroundColor:HexColor('${category.color}'),
//icon: Icon(
//Icons.check,
//color: HexColor('#444444'),
//),
//title: Text(''))
//],
//),
