import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/domain/usecases/loan/get_loans_by_user_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user_borrowed_event.dart';
part 'user_borrowed_state.dart';

class UserBorrowedBloc extends Bloc<UserBorrowedEvent, UserBorrowedState> {

  final GetLoansByUserUsecase _getLoansByUser;

  UserBorrowedBloc(this._getLoansByUser) : super(UserBorrowedInitial()) {
    on<GetUserBorrowed>(onGetUserBorrowed);
  }

  @override
  onChange(Change<UserBorrowedState> change) {
    super.onChange(change);
    logger.d(change);
  }

  FutureOr<void> onGetUserBorrowed(GetUserBorrowed event, Emitter<UserBorrowedState> emit) async {
    emit(UserBorrowedLoading());
    try {
      int? id = JwtDecoder.decode(await getIt.get<SessionManager>().get("jwt"))['id'];
      if (id == null) {
        emit(const UserBorrowedError.genericError("User id is null"));
        return;
      }
      final dataState = await _getLoansByUser(params: {'userId': id});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(UserBorrowedLoaded(
            dataState.statusCode, dataState.data! as List<LoanModel>));
      } else if (dataState is DataFailed) {
        emit(UserBorrowedError(dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(UserBorrowedError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(UserBorrowedError.genericError(e));
    }
  }
}
