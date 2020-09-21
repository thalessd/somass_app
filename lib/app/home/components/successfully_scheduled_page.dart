import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessfullyScheduledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.green,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/accept.svg",
                color: Colors.white,
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Missa Agendada\ncom Sucesso!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "DancingScript",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton.icon(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                splashColor: Colors.green[500],
                color: Colors.green[900],
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                label: Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {Navigator.of(context).pop();},
              )
            ],
          ))),
    );
  }
}
