import 'package:flutter/material.dart';
import 'components/info_page.dart';
import 'components/successfully_scheduled_page.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoPage();
  }
}
