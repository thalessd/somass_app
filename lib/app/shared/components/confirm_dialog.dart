import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog({
    this.confirmButtonText = "Ok",
    this.cancelButtonText = "Cancelar",
    @required this.title,
    @required this.contentText,
    @required this.onConfirm,
    @required this.onCancel,
  });

  final String confirmButtonText;
  final String cancelButtonText;

  final Function() onConfirm;
  final Function() onCancel;

  final String title;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contentText),
      actions: <Widget>[
        FlatButton(
          child: Text(cancelButtonText),
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(confirmButtonText),
          onPressed: () {
            onConfirm();
          },
        )
      ],
    );
  }
}