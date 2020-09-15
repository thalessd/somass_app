import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/constants/style.dart';


class ListTileSection extends StatelessWidget {
  ListTileSection(
      {@required this.title, this.alignment = Alignment.centerLeft});

  final Alignment alignment;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.only(left: Style.LIST_TILE_MARGIN, top: 8, bottom: 8),
        child: Text(
          this.title,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle2.fontSize,
              fontWeight: Theme.of(context).textTheme.subtitle2.fontWeight,
              color: Colors.black87),
        ),
      ),
    );
  }
}
