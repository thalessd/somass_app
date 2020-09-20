import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DevdesInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
