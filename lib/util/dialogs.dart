import 'package:Wordy/util/utils.dart';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> showCorrectAnswerDialog(BuildContext context,
      String title,
      String meaning,
      String word,) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 350,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Align(
                            alignment: FractionalOffset.topCenter,
                            child: FittedBox(
                              child: Image.asset(
                                'images/img_correct.png',
                                height: 70.0,
                                width: 70.0,
                              ),
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
                            'Correct Answer',
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
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '$word ',
                                style: TextStyle(color: HexColor('#444444'), fontSize: 14.0, fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '$meaning',
                                    style: TextStyle(color: HexColor('#444444'), fontSize: 14.0, fontWeight: FontWeight.normal),
                                  )
                                ]
                              )
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: RaisedButton(
                          color: HexColor('#8BFF74'),
                          onPressed: () =>
                              Navigator.of(context).pop(DialogAction.abort),
                          child: const Text('Close'),
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
