import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/models/public_event.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final PublicEvent event;
  final Function(PublicEvent) onOpenEvent;

  EventCard({@required this.event, @required this.onOpenEvent});

  @override
  Widget build(BuildContext context) {

    final timeFormat = DateFormat("HH'h' mm");

    final dayBrl = Helper.dayOfWeekToBrlShort(event.dayOfWeek).toUpperCase();
    final time = timeFormat.format(event.date.add(Duration(hours: -3)));

    final cardColor = event.hasPassed
        ? Colors.grey[800]
        : event.hasParticipation ? Colors.blueAccent : Colors.lightGreen[700];

    final cardBottomDescription = event.hasPassed ? "Indisponível" : event
        .hasParticipation ? "Agendado" : "${event.occupiedVacancies} de ${event
        .totalVacancies}";

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(0.0),
      color: cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: event.hasPassed ? null : () { onOpenEvent(event); },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayBrl,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 60,
                height: 1,
                margin: EdgeInsets.only(top: 4, bottom: 4),
                color: Colors.white,
              ),
              Text(
                time,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Text(cardBottomDescription, style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        ),)
      ],
    )),
    )
    ,
    );
  }
}
