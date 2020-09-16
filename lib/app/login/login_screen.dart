import 'package:flutter/material.dart';
import 'package:somass_app/app/login/components/login_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    return LoginPage(title: "Paróquia de São Simão", onSubmit: (String cpf) {}, load: _load);
  }
}
