import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/models/public_event.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final PublicEvent event;

  EventCard({@required this.event});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat("hh:mm");

    final dayBrl = Helper.dayOfWeekToBrlText(event.dayOfWeek).toUpperCase();
    final time = timeFormat.format(event.date);

    final cardColor = event.hasPassed
        ? Colors.grey[800]
        : event.hasParticipation ? Colors.blueAccent : Colors.lightGreen[700];

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(0.0),
      color: cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
