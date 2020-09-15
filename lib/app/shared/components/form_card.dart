import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/constants/style.dart';

class FormCard extends StatelessWidget {
  FormCard({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          child: Card(
            elevation: 4,
            color: Colors.white,
            child: Container(
                padding: EdgeInsets.all(Style.CARD_MARGIN),
                child: child),
          ),
        ));
  }
}
