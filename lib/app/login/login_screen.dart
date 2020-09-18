import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:somass_app/app/login/components/login_page.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/services/client_service.dart';
import 'package:snack/snack.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _load = false;

  void toggleLoad(load) {
    setState(() {
      _load = load;
    });
  }

  void onEnter(String cpf) async {
    try {
      toggleLoad(true);

      final enterResponse = await ClientService.enter(cpf);

      Helper.loginClientDirect(context, enterResponse);
    } catch (e) {
      final dioError = e as DioError;

      if(dioError?.response?.statusCode == 400) {
        return SnackBar(content: Text("Problema ao Fazer Login"),).show(context);
      }

      return SnackBar(content: Text("Erro, Verifique sua Internet"),).show(context);
    } finally {
      toggleLoad(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(
        title: "Paróquia de São Simão", onSubmit: onEnter, load: _load);
  }
}
