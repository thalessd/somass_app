import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          child: Text("Sair do App"),
          onPressed: () {
            Helper.exitFromApp(context);
          },
        ),
      ),
    );
  }
}