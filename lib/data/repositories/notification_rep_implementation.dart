

import 'package:bookpal/data/models/notification_model.dart';
import 'package:bookpal/domain/repositories/notification_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class NotificationRepositoryImplementation implements NotificationRepository {
  @override
  Future<DataState<NotificationModel>> getNotification() {
    throw UnimplementedError();
  }
  @override
  Future<DataState<List<NotificationModel>>> getUserNotifications() {
    throw UnimplementedError();
  }
}