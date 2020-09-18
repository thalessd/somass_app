import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somass_app/app/login/components/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({@required this.onSubmit, @required this.title, this.load = false});

  final Function(String) onSubmit;
  final String title;
  final load;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(35.0),
                        bottomRight: const Radius.circular(35.0),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/church-background.png"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                "assets/images/church-black.svg",
                                color: Colors.white,
                                height: 120,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Text(
                                  "Agendamento\nde Missas",
                                  style: TextStyle(
                                    fontFamily: "DancingScript",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            this.title,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child:
                              LoginForm(onSubmit: this.onSubmit, load: this.load),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(
                                  "assets/images/devdes-brand-color.svg",
                                  height: 25,
                                ),
                              ),
                              SizedBox(
                                width: 1,
                                height: 28,
                                child: Container(
                                  padding: EdgeInsets.only(right: 2, left: 2),
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "www.devdes.io | 89 99988 9460\npor: Thales Carvalho",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (load)
                LinearProgressIndicator(
                  minHeight: 8,
                  backgroundColor:
                      Theme.of(context).accentColor.withOpacity(0.4),
                )
            ],
          ),
        ),
      ),
    );
  }
}
