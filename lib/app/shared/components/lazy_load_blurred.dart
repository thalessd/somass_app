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
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4)),
                  child: Center(
                      child: Container(
                    width: 75,
                    height: 75,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
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
