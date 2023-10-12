
import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  final GeneralDatabaseApiService _generalDatabaseApiService;

  UserRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<UserModel>> getUser(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getUser(
        id: id,
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
