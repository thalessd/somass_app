import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetError extends StatelessWidget {
  WidgetError(
      {@required this.onRefresh, this.message = "Não foi Possivel\nCarregar"});

  final Function onRefresh;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/sad-cloud.svg',
          color: Theme.of(context).primaryColor,
          height: 100,
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: onRefresh,
        )
      ],
    );
  }
}
