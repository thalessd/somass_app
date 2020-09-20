import 'package:flutter/material.dart';
import 'package:somass_app/app/successfully_scheduled/components/successfully_scheduled_page.dart';

class SuccessfullyScheduledScreen extends StatefulWidget {
  SuccessfullyScheduledScreen({Key key}) : super(key: key);

  @override
  _SuccessfullyScheduledScreenState createState() => _SuccessfullyScheduledScreenState();
}

class _SuccessfullyScheduledScreenState extends State<SuccessfullyScheduledScreen> {
  @override
  Widget build(BuildContext context) {
    return SuccessfullyScheduledPage();
  }
}
