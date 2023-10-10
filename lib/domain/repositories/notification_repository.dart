

import 'package:bookpal/domain/entities/notification.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class NotificationRepository {
  Future<DataState<Notification>> getNotification();
  Future<DataState<List<Notification>>> getUserNotifications();
}