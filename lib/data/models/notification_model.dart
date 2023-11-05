

import 'package:bookpal/data/enums/notification_status.dart';
import 'package:bookpal/domain/entities/notification.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends Notification {
  NotificationModel({
    required int id,
    required int userId,
    required String title,
    required String message,
    required DateTime nextScheduleDate,
    NotificationStatus status = NotificationStatus.unread,
  }) : super(
    id: id,
    userId: userId,
    title: title,
    message: message,
    nextScheduleDate: nextScheduleDate,
    status: status,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
  
}