import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String badgeText;

  SectionTitle({this.title, this.badgeText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          if(badgeText != null) Card(
            color: Theme.of(context).accentColor,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
              child: Text(badgeText),
            ),
          )
        ],
      ),
    );
  }
}
