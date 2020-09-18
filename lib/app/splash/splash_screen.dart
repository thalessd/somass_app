import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'components/splash_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Helper.splashClientDirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
