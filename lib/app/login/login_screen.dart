import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somass_app/app/shared/components/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
    resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(35.0),
                      bottomRight: const Radius.circular(35.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/church-background.png"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow[800].withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Paróquia de São Simão",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 22,
                            color: Colors.white,
//                      fontWeight: FontWeight.w300
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FractionallySizedBox(
                                widthFactor: .8,
                                child: DefaultTextFormField(
                                  labelText: "CPF",
                                  icon: Icon(Icons.person),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: FractionallySizedBox(
                                  widthFactor: .8,
                                  child: RaisedButton(
                                    color: Theme.of(context).primaryColor,
                                    elevation: 1,
                                    child: Text("ENTRAR", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,

                                      letterSpacing: 2.0,
                                      // color: Theme.of(context).primaryColorDark
                                    )),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                  color: Colors.grey[400],),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("www.devdes.io | 89 99988 9460\npor: Thales Carvalho", style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11
                                ),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
