
import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/domain/usecases/authentication/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginUsecase _login;

  LoginBloc(this._login) : super(LoginInitial()) {
    on<Login>(onLogin);
  }

  void onLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final dataState = await _login(params: {
        'email': event.email,
        'password': event.password
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoginSuccess(dataState.statusCode, dataState.data!));
        await getIt.get<SessionManager>().set("jwt", dataState.data!['raw_jwt']);
        await getIt.get<FlutterSecureStorage>().write(key: "jwt", value: dataState.data!['raw_jwt']);
      } else if (dataState is DataFailed) {
        logger.e(dataState.error);
        emit(LoginError(dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e){
      logger.d(e.response);
      emit(LoginError(e, e.response?.statusCode ?? 500, e.response?.data['message'] ?? "No message"));
    } catch (e) {
      logger.d(e.toString());
      emit(LoginError.genericError(e));
    }
  }
}
