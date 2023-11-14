

// import 'package:bookpal/data/data_sources/remote/api_service.dart';
// import 'package:bookpal/data/util/response_verifier.dart';
// import 'package:bookpal/data/models/notification_model.dart';
// import 'package:bookpal/domain/repositories/notification_repository.dart';
// import 'package:bookpal/core/resources/data_state.dart';
// import 'package:dio/dio.dart';

// class NotificationRepositoryImplementation implements NotificationRepository {

//   final ApiService _apiService;

//   NotificationRepositoryImplementation(this._apiService);

//   @override
//   Future<DataState<NotificationModel>> getNotification(int id) async {
//     try {
//       final httpResponse = await _apiService.getNotification(
//         id: id,
//       );
//       final ResponseVerifier<NotificationModel> responseVerifier = ResponseVerifier<NotificationModel>();
//       return responseVerifier.validateResponse(httpResponse);
//     } on DioException catch (e) {
//       List<String>? messages = (e.response?.data['message'] is List)
//           ? List<String>.from(e.response?.data['message'].map((m) => m.toString()))
//           : [e.response?.data['message']];
//       return DataFailed(
//           e.response?.statusCode ?? 500, e, messages);
//     }
//   }
//   @override
//   Future<DataState<List<NotificationModel>>> getUserNotifications(int userId) async {
//     try {
//       final httpResponse = await _apiService.getUserNotifications(
//         userId: userId,
//       );
//       final ResponseVerifier<List<NotificationModel>> responseVerifier = ResponseVerifier<List<NotificationModel>>();
//       return responseVerifier.validateResponse(httpResponse);
//     } on DioException catch (e) {
//       return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
//     }
//   }
// }