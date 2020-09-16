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

    final int primaryColor = 0xFFFFC65C;
    final int primaryColorLight = 0xFFFFE2AD;
    final int primaryColorDark = 0xFFE09200;
    final int accentColor = 0xFF6CFFB2;

    final MaterialColor materialColor = MaterialColor(primaryColor, <int, Color>{
      50:  Color(0xFFFFF1D6),
      100: Color(primaryColorLight),
      200: Color(0xFFFFD485),
      300: Color(primaryColor),
      400: Color(0xFFFFB833),
      500: Color(0xFFFFA90A),
      600: Color(primaryColorDark),
      700: Color(0xFFB87700),
      800: Color(0xFFB87700),
      900: Color(0xFF664200),
    });

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
            primaryColor: Color(primaryColor),
            primaryColorLight: Color(primaryColorLight),
            primaryColorDark: Color(primaryColorDark),
            accentColor: Color(accentColor),
            primarySwatch: materialColor,
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
