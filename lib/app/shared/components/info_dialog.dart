import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  InfoDialog({
    this.confirmButtonText = "Ok",
    @required this.title,
    @required this.contentText,
    @required this.onConfirm,
  });

  final String confirmButtonText;

  final Function() onConfirm;

  final String title;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contentText),
      actions: <Widget>[
        RaisedButton(
          child: Text(confirmButtonText),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        )
      ],
    );
  }
}