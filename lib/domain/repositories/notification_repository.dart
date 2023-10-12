

import 'package:bookpal/domain/entities/notification.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class NotificationRepository {
  Future<DataState<Notification>> getNotification(String id);
  Future<DataState<List<Notification>>> getUserNotifications(String userId);
}