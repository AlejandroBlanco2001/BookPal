

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/notification_model.dart';
import 'package:bookpal/domain/repositories/notification_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImplementation implements NotificationRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  NotificationRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<NotificationModel>> getNotification(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getNotification(
        id: id,
      );
      final ResponseVerifier<NotificationModel> responseVerifier = ResponseVerifier<NotificationModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
  @override
  Future<DataState<List<NotificationModel>>> getUserNotifications(String userId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getUserNotifications(
        userId: userId,
      );
      final ResponseVerifier<List<NotificationModel>> responseVerifier = ResponseVerifier<List<NotificationModel>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}