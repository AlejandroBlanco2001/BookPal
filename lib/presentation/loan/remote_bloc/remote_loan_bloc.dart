import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/domain/usecases/loan/create_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loans_by_user_usecase.dart';
import 'package:bookpal/domain/usecases/loan/make_loan_return_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_loan_event.dart';
part 'remote_loan_state.dart';

class RemoteLoanBloc extends Bloc<RemoteLoanEvent, RemoteLoanState> {
  final GetLoanUsecase _getLoan;
  final GetLoansByUserUsecase _getLoansByUser;
  final CreateLoanUsecase _createLoan;
  final MakeLoanReturnUsecase _makeLoanReturn;

  RemoteLoanBloc(this._createLoan, this._getLoan, this._getLoansByUser,
      this._makeLoanReturn)
      : super(RemoteLoanInitial()) {
    on<GetLoan>(onGetLoan);
    on<GetLoansByUser>(onGetLoansByUser);
    on<CreateLoan>(onCreateLoan);
    on<MakeLoanReturn>(onMakeLoanReturn);
  }

  FutureOr<void> onGetLoan(GetLoan event, Emitter<RemoteLoanState> emit) async {
    emit(RemoteLoanLoading());
    try {
      final dataState = await _getLoan(params: {'id': event.id});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteLoanLoaded(
            dataState.statusCode, dataState.data! as LoanModel));
      } else if (dataState is DataFailed) {
        emit(RemoteLoanError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      emit(RemoteLoanError(e, e.response?.statusCode));
    } catch (e) {
      emit(RemoteLoanError.genericError(e));
    }
  }

  FutureOr<void> onGetLoansByUser(
      GetLoansByUser event, Emitter<RemoteLoanState> emit) async {
    emit(RemoteLoanLoading());
    try {
      final dataState = await _getLoansByUser(params: {'userId': event.userId});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserLoansLoaded(
            dataState.statusCode, dataState.data! as List<LoanModel>));
      } else if (dataState is DataFailed) {
        emit(RemoteLoanError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      emit(RemoteLoanError(e, e.response?.statusCode));
    } catch (e) {
      emit(RemoteLoanError.genericError(e));
    }
  }

  FutureOr<void> onCreateLoan(
      CreateLoan event, Emitter<RemoteLoanState> emit) async {
    emit(RemoteLoanLoading());
    try {
      final dataState = await _createLoan(
          params: {'userId': event.userId, 'bookId': event.bookId});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteLoanCreated(
            dataState.statusCode, dataState.data! as LoanModel));
      } else if (dataState is DataFailed) {
        emit(RemoteLoanError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      emit(RemoteLoanError(e, e.response?.statusCode));
    } catch (e) {
      emit(RemoteLoanError.genericError(e));
    }
  }

  FutureOr<void> onMakeLoanReturn(
      MakeLoanReturn event, Emitter<RemoteLoanState> emit) async {
    emit(RemoteLoanLoading());
    try {
      final dataState = await _makeLoanReturn(params: {'id': event.id});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteLoanReturned(
            dataState.statusCode, dataState.data! as LoanModel));
      } else if (dataState is DataFailed) {
        emit(RemoteLoanError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      emit(RemoteLoanError(e, e.response?.statusCode));
    } catch (e) {
      emit(RemoteLoanError.genericError(e));
    }
  }
}
