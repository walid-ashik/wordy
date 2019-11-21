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
  _GamePlayPageState(Category category){
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('${category.color}'),
      body: Center(
        child: Text('${category.name}'),
      ),
    );
  }
}
