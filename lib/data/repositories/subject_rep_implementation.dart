

// import 'package:bookpal/data/data_sources/remote/api_service.dart';
// import 'package:bookpal/data/util/response_verifier.dart';
// import 'package:bookpal/data/models/subject_model.dart';
// import 'package:bookpal/domain/entities/subject.dart';
// import 'package:bookpal/domain/repositories/subject_repository.dart';
// import 'package:bookpal/core/resources/data_state.dart';
// import 'package:dio/dio.dart';

// class SubjectRepositoryImplementation implements SubjectRepository {

//   final ApiService _apiService;

//   SubjectRepositoryImplementation(this._apiService);

//   @override
//   Future<DataState<Subject>> getSubject(int id) async {
//     try {
//       final httpResponse = await _apiService.getSubject(
//         id: id,
//       );
//       final ResponseVerifier<SubjectModel> responseVerifier = ResponseVerifier<SubjectModel>();
//       return responseVerifier.validateResponse(httpResponse);
//     } on DioException catch (e) {
//       return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
//     }
//   }
// }