

import 'package:bookpal/data/enums/notification_status.dart';

abstract class Notification {
  final String id;
  final String userId;
  final String title;
  final String message;
  NotificationStatus status;
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