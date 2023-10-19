

import 'package:bookpal/data/enums/notification_status.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Notification {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String title;
  final String message;
  NotificationStatus status;
  @JsonKey(name: 'next_schedule_date')
  final DateTime nextScheduleDate;

  Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    this.status = NotificationStatus.unread,
    required this.nextScheduleDate,
  });
  
}