import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/domain/usecases/authentication/login_usecase.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_pages_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _login;
  final NavigationBloc _navigationBloc;
  final NavigationPagesBloc _navigationPagesBloc;
  final UserBorrowedBloc _userBorrowedBloc;

  LoginBloc(this._login, this._navigationBloc, this._userBorrowedBloc,
      this._navigationPagesBloc)
      : super(LoginInitial()) {
    on<InitLogin>(onInitLogin);
    on<Login>(onLogin);
    on<Logout>(onLogout);
  }

  FutureOr<void> onInitLogin(InitLogin event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    var existingJwt = await getIt.get<FlutterSecureStorage>().read(key: "jwt");
    if (existingJwt != null && !JwtDecoder.isExpired(existingJwt)) {
      emit(LoginSuccess(200, {
        "raw_jwt": existingJwt,
        "decoded_jwt": Utilities.unifyNames(JwtDecoder.decode(existingJwt))
      }));
      _navigationPagesBloc.add(const LoggedIn());
      _navigationBloc.add(ToHomePage());
      await getIt.get<SessionManager>().set("jwt", existingJwt);
      _userBorrowedBloc.add(const GetUserBorrowed());
    } else {
      emit(LoginInitial());
      _navigationPagesBloc.add(const NotLoggedIn());
      _navigationBloc.add(ToHomePage());
    }
  }

  Future<void> onLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final dataState = await _login(
          params: {'email': event.email, 'password': event.password});
      if (dataState is DataSuccess && dataState.data != null) {
        await getIt
            .get<SessionManager>()
            .set("jwt", dataState.data!['raw_jwt']);
        _userBorrowedBloc.add(const GetUserBorrowed());
        getIt
            .get<FlutterSecureStorage>()
            .write(key: "jwt", value: dataState.data!['raw_jwt']);
        emit(LoginSuccess(dataState.statusCode, dataState.data!));
        _navigationPagesBloc.add(const LoggedIn());
        _navigationBloc.add(ToHomePage());
      } else if (dataState is DataFailed) {
        logger.e(dataState.error);
        emit(LoginError(
            dataState.error!, dataState.statusCode, dataState.message));
        _navigationPagesBloc.add(const NotLoggedIn());
      }
    } on DioException catch (e) {
      logger.d(e.response);
      emit(LoginError(e, e.response?.statusCode ?? 500,
          e.response?.data['message'] ?? "No message"));
      _navigationPagesBloc.add(const NotLoggedIn());
    } catch (e) {
      logger.d(
          "Message: ${e.toString()}.\nStacktrace: ${(e is Error) ? e.stackTrace : e}");
      emit(LoginError.genericError(e));
      _navigationPagesBloc.add(const NotLoggedIn());
    }
  }

  FutureOr<void> onLogout(Logout event, Emitter<LoginState> emit) async {
    emit(LoggingOut());
    _navigationPagesBloc.add(const NotLoggedIn());
    _navigationBloc.add(ToHomePage());
    await getIt.get<SessionManager>().destroy();
    await getIt.get<FlutterSecureStorage>().delete(key: "jwt");
    emit(LoginInitial());
  }
}
