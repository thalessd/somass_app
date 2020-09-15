import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:somass_app/app/home/home_screen.dart';
import 'package:somass_app/app/login/login_screen.dart';
import 'package:somass_app/app/shared/providers/app_provider.dart';
import 'package:somass_app/app/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final List<SingleChildWidget> providers = [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: "SOMASS App",
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        builder: (context, child) => Scaffold(
          body: child,
        ),
        theme: ThemeData(
            primaryColor: Color(0xFFFFC65C),
            primaryColorDark: Color(0xFFE09200),
            accentColor: Color(0xFF5D7E98),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.only(top: 14, bottom: 14, left: 22, right: 22 ),
            )),
        initialRoute: '/login',
        // Rota Inicial Real é "/"
        routes: {
          "/": (context) => SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
