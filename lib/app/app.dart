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
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login', // Rota Inicial Real é "/"
        routes: {
          "/": (context) => SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
