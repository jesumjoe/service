import 'package:flutter/material.dart';

class Attendance {
  final String id;
  final String beneficiaryId;
  final String? staffId;
  final DateTime date;
  final TimeOfDay time;
  final String? locationStamp;
  final DateTime createdAt;

  Attendance({
    required this.id,
    required this.beneficiaryId,
    this.staffId,
    required this.date,
    required this.time,
    this.locationStamp,
    required this.createdAt,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    final timeString = json['time'] as String;
    final timeParts = timeString.split(':');
    final time = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    return Attendance(
      id: json['id'] as String,
      beneficiaryId: json['beneficiary_id'] as String,
      staffId: json['staff_id'] as String?,
      date: DateTime.parse(json['date'] as String),
      time: time,
      locationStamp: json['location_stamp'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
    return {
      'id': id,
      'beneficiary_id': beneficiaryId,
      if (staffId != null) 'staff_id': staffId,
      'date': date.toIso8601String().split('T')[0],
      'time': timeString,
      if (locationStamp != null) 'location_stamp': locationStamp,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
