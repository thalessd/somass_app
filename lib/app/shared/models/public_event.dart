import 'package:somass_app/app/shared/models/day_of_week.dart';

class PublicEvent {
  String id;
  String location;
  DateTime date;
  DayOfWeek dayOfWeek;
  int totalVacancies;
  int occupiedVacancies;
  bool hasParticipation;
  bool hasPassed;

  PublicEvent(
      {this.id,
      this.location,
      this.date,
      this.dayOfWeek,
      this.totalVacancies,
      this.occupiedVacancies,
      this.hasParticipation,
      this.hasPassed});

  factory PublicEvent.fromJson(Map<String, dynamic> json) {
    return PublicEvent(
        id: json['id'] as String,
        location: json['location'] as String,
        date: DateTime.parse(json['date'] as String),
        dayOfWeek: DayOfWeek.values[json['dayOfWeek'] as int],
        totalVacancies: json['totalVacancies'] as int,
        occupiedVacancies: json['occupiedVacancies'] as int,
        hasParticipation: json['hasParticipation'] as bool,
        hasPassed: json['hasPassed'] as bool,
    );
  }
}
