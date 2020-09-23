import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/components/default_text_form_field.dart';
import 'package:somass_app/app/shared/helpers/input_validator.dart';

class NameEditDialog extends StatefulWidget {
  NameEditDialog(
      {Key key,
      @required this.title,
      @required this.onCancel,
      @required this.onConfirm,
      this.initialValue = "",
      this.inputTitle = ""})
      : super(key: key);

  final String title;
  final String inputTitle;
  final String initialValue;
  final Function onCancel;
  final Function(String) onConfirm;

  @override
  _NameEditDialogState createState() => _NameEditDialogState();
}

class _NameEditDialogState extends State<NameEditDialog> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";

  void onConfirmPressed() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    widget.onConfirm(_name.trim());

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
          key: _formKey,
          child: DefaultTextFormField(
            labelText: widget.inputTitle,
            disabled: false,
            initialValue: widget.initialValue,
            icon: Icon(Icons.text_fields),
            validator: InputValidator.isRequiredMin(10, message: "Nome Completo"),
            onSaved: (String name) {
              _name = name;
            },
          )),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            widget.onCancel();
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Text("Confirmar"),
          onPressed: () {
            onConfirmPressed();
          },
        )
      ],
    );
  }
}
