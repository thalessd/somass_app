import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somass_app/app/home/components/name_form.dart';
import 'package:somass_app/app/shared/components/lazy_load_blurred.dart';
import 'package:somass_app/app/shared/constants/style.dart';

class NamePage extends StatelessWidget {

  final Function exitFromApp;
  final Function(String) onSave;
  final bool load;

  NamePage({this.exitFromApp, this.load = false, @required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Seu Nome"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: exitFromApp,
          )
        ],
      ),
      body: LazyLoadBlurred(
        show: load,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(Style.APP_MARGIN),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FractionallySizedBox(
                  widthFactor: .7,
                  child: SvgPicture.asset(
                    "assets/images/undraw-text-field-htlv.svg",
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(Style.CARD_MARGIN),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Coloque seu nome no campo a baixo para que possamos lhe identificar.',
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.headline6.fontSize,
                              fontFamily: "Cairo",
                              height: 1.2
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        NameForm(onSave: onSave, load: load,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
