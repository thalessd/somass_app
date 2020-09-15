import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LazyLoadBlurred extends StatelessWidget {
  LazyLoadBlurred({this.child, this.show = false});

  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    final blurredProgress = Center(
      child: ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.80)),
                  child: Center(
                      child: Container(
                    width: 75,
                    height: 75,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 12,
                    ),
                  ))),
            )),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[child, if (show) blurredProgress],
    );
  }
}
