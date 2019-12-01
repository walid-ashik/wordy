import 'package:Wordy/util/utils.dart';
import 'package:flutter/material.dart';

import 'custom_elevation.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> showCorrectAnswerDialog(BuildContext context,
      String title, String meaning, String word, bool isAnswerCorrect) async {
    Image topImage;
    String titleText;
    Color buttonColor;
    String buttonText = '';

    if (isAnswerCorrect) {

      topImage = Image.asset(
        'images/img_correct.png',
        height: 70.0,
        width: 70.0,
      );

      titleText = 'Correct Answer';
      buttonColor = HexColor('#8BFF74');
      buttonText = 'NEXT';
    } else {
      topImage = Image.asset(
        'images/img_wrong_cross.png',
        height: 70.0,
        width: 70.0,
      );

      titleText = 'Wrong Guess';
      buttonColor = HexColor('#FF9292');
      buttonText = 'TRY AGAIN';
    }

    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Align(
                            alignment: FractionalOffset.topCenter,
                            child: FittedBox(
                              child: topImage,
                              fit: BoxFit.fill,
                            ))),
                    SizedBox(
                      height: 30.0,
                    ),
                    Positioned(
                      child: Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 100.0),
                          child: Text(
                            titleText,
                            style: TextStyle(
                                color: HexColor('#444444'),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: '$word ',
                                    style: TextStyle(
                                        color: HexColor('#444444'),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '$meaning',
                                        style: TextStyle(
                                            color: HexColor('#444444'),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ]))),
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            color: buttonColor,
                            onPressed: () =>
                                Navigator.of(context).pop(DialogAction.abort),
                            child: Text('$buttonText'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
    return (action != null) ? action : DialogAction.abort;
  }
}

//title: Text(title),
//content: Text(body),
//actions: <Widget>[
//FlatButton(
//onPressed: () => Navigator.of(context).pop(DialogAction.abort),
//child: const Text('CLOSE'),
//),
//FlatButton(
//onPressed: () => Navigator.of(context).pop(DialogAction.yes),
//child: const Text('OK'),
//)
//],

//akij mia
