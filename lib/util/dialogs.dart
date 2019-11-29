import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> showCorrectAnswerDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(DialogAction.abort),
                child: const Text('CLOSE'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(DialogAction.yes),
                child: const Text('OK'),
              )
            ],
          );
        });
    return (action != null) ? action : DialogAction.abort;
  }
}
