import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/models/public_event.dart';

class EventDialog extends StatefulWidget {
  EventDialog({
    Key key,
    @required this.onSubscribe,
    @required this.onUnsubscribe,
    @required this.event,
  }) : super(key: key);

  final Function(PublicEvent) onSubscribe;
  final Function(PublicEvent) onUnsubscribe;
  final PublicEvent event;

  @override
  _EventDialogState createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  void onConfirmPressed() {
    if (widget.event.hasParticipation) {
      widget.onUnsubscribe(widget.event);
    } else {
      widget.onSubscribe(widget.event);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final confirmText =
        widget.event.hasParticipation ? "Desagendar" : "Agendar";
    final confirmBtnColor =
        widget.event.hasParticipation ? Colors.deepOrangeAccent : Colors.green;
    final confirmBtnIcon = widget.event.hasParticipation
        ? MdiIcons.calendarExport
        : MdiIcons.calendarImport;

    final correctDate = widget.event.date.add(Duration(hours: -3));

    final dateFormat = DateFormat("dd/MM/yy 'às' HH'h' mm");

    final formatedDate = dateFormat.format(correctDate);

    return AlertDialog(
      title: Text(confirmText),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.people),
            contentPadding: EdgeInsets.all(0),
            dense: true,
            title: Text(
                "${widget.event.occupiedVacancies} Ocupadas de ${widget.event.totalVacancies}"),
          ),
          ListTile(
            leading: Icon(MdiIcons.calendar),
            contentPadding: EdgeInsets.all(0),
            dense: true,
            title: Text(formatedDate),
          ),
          ListTile(
            leading: Icon(MdiIcons.calendarRange),
            contentPadding: EdgeInsets.all(0),
            dense: true,
            title: Text(Helper.dayOfWeekToBrlLong(widget.event.dayOfWeek)),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Fechar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton.icon(
          icon: Icon(confirmBtnIcon),
          label: Text(confirmText),
          color: confirmBtnColor,
          onPressed: () {
            onConfirmPressed();
          },
        )
      ],
    );
  }
}
