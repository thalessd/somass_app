import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/components/default_text_form_field.dart';
import 'package:somass_app/app/shared/helpers/input_validator.dart';

class NameForm extends StatefulWidget {
  NameForm({Key key, this.load = false, @required this.onSave})
      : super(key: key);

  final Function(String) onSave;
  final bool load;

  @override
  _NameFormState createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  final _formKey = GlobalKey<FormState>();

  String _fullName = "";

  void onSavePressed() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    widget.onSave(_fullName.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            labelText: "Seu Nome Completo",
            disabled: widget.load,
            icon: Icon(Icons.text_fields),
            validator: InputValidator.isRequiredMin(10, message: "Seu Nome Completo"),
            onSaved: (String fullName) {
              _fullName = fullName;
            },
          ),
          SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: RaisedButton.icon(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              icon: Icon(Icons.arrow_forward),
              color: Theme.of(context).accentColor,
              elevation: 1,
              label: Text("CONTINUAR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                  )),
              onPressed: widget.load ? null : onSavePressed,
            ),
          )
        ],
      ),
    );
  }
}
