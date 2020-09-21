import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/components/default_text_form_field.dart';
import 'package:somass_app/app/shared/helpers/input_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, @required this.onSubmit, this.load = false})
      : super(key: key);

  final Function(String) onSubmit;
  final bool load;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _cpfMaskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  String _cpf = "";

  void onLoginPressed() {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    widget.onSubmit(CPFValidator.strip(_cpf));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: .8,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Text("Entre com o seu CPF abaixo:", style: Theme.of(context).textTheme.bodyText1),
                ),
                SizedBox(height: 10,),
                DefaultTextFormField(
                  labelText: "CPF",
                  icon: Icon(Icons.person),
                  validator: InputValidator.isCPFRequired,
                  keyboardType: TextInputType.number,
                  inputFormatters: [_cpfMaskFormatter],
                  disabled: widget.load,
                  onSaved: (String cpf) {
                    this._cpf = cpf;
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: FractionallySizedBox(
              widthFactor: .8,
              child: Column(
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: RaisedButton.icon(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      icon: Icon(Icons.arrow_forward),
                      color: Theme.of(context).accentColor,
                      elevation: 1,
                      label: Text("ENTRAR",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.0,
                          )),
                      onPressed: widget.load ? null : onLoginPressed,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.verified_user, color: Colors.grey[300], size: 18,), SizedBox(width: 6,),Text("SEUS DADOS ESTÃO SEGUROS", style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                        fontWeight: Theme.of(context).textTheme.bodyText1.fontWeight,
                        color: Colors.grey[300]
                      ))],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
