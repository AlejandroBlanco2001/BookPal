import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/company_model.dart';
import 'package:bookpal/domain/usecases/company/get_companies_usecase.dart';
import 'package:bookpal/domain/usecases/company/get_company_usecase.dart';
import 'package:bookpal/domain/usecases/company/init_company_usecase.dart';
import 'package:bookpal/domain/usecases/company/update_company_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_company_event.dart';
part 'remote_company_state.dart';

class RemoteCompanyBloc extends Bloc<RemoteCompanyEvent, RemoteCompanyState> {
  final GetCompanyUsecase _getCompany;
  final InitCompanyUsecase _initCompany;
  final GetCompaniesUsecase _getCompanies;
  final UpdateCompanyUsecase _updateCompany;

  RemoteCompanyBloc(this._getCompany, this._initCompany , this._getCompanies, this._updateCompany)
      : super(RemoteCompanyInitial()) {
    on<InitCompany>(onInitCompany);
    on<GetCompany>(onGetCompany);
    on<GetCompanies>(onGetCompanies);
    on<UpdateCompany>(onUpdateCompany);
  }

  FutureOr<void> onInitCompany(
      InitCompany event, Emitter<RemoteCompanyState> emit) async {
    emit(RemoteCompanyLoading());
    try {
      final dataState = await _initCompany(params: {'id': 1});
      logger.d("Company: ${dataState.data}");
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteCompanyLoaded(
            dataState.statusCode, dataState.data! as CompanyModel));
      } else if (dataState is DataFailed) {
        emit(RemoteCompanyError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      logger.d("DioException: $e");
      emit(RemoteCompanyError(e, e.response?.statusCode));
    } catch (e) {
      logger.d(
          "Error Message: ${e.toString()}.\n StackTrace: ${(e as Error).stackTrace}");
      emit(RemoteCompanyError.genericError(e));
    }
  }

  onGetCompany(GetCompany event, Emitter<RemoteCompanyState> emit) async {
    emit(RemoteCompanyLoading());
    try {
      final dataState = await _getCompany(params: {'id': event.id});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteCompanyLoaded(
            dataState.statusCode, dataState.data! as CompanyModel));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.error}");
        emit(RemoteCompanyError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: $e");
      emit(RemoteCompanyError(
          e, e.response?.statusCode, e.response?.data['message']));
    } catch (e) {
      logger.d(
          "Error Message: ${e.toString()}.\n StackTrace: ${(e as Error).stackTrace}");
      emit(RemoteCompanyError.genericError(e));
    }
  }

  FutureOr<void> onGetCompanies(
      GetCompanies event, Emitter<RemoteCompanyState> emit) async {
    emit(RemoteCompanyLoading());
    try {
      final dataState = await _getCompanies();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteCompaniesLoaded(
            dataState.statusCode, dataState.data! as List<CompanyModel>));
      } else if (dataState is DataFailed) {
        emit(RemoteCompanyError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      emit(RemoteCompanyError(e, e.response?.statusCode));
    } catch (e) {
      emit(RemoteCompanyError.genericError(e));
    }
  }

  FutureOr<void> onUpdateCompany(
      UpdateCompany event, Emitter<RemoteCompanyState> emit) async {
    emit(RemoteCompanyLoading());
    try {
      final dataState = await _updateCompany(
          params: {'id': event.id, 'fields': event.fields});
      if (dataState is DataSuccess && dataState.data != null) {
        logger.i("Company updated");
        emit(RemoteCompanyUpdated(
            dataState.statusCode, dataState.data! as CompanyModel));
      } else if (dataState is DataFailed) {
        logger.i("Update failed");
        emit(RemoteCompanyError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.e("DioException: $e");
      emit(RemoteCompanyError(e, e.response?.statusCode));
    } catch (e) {
      logger.e("Error: $e");
      emit(RemoteCompanyError.genericError(e));
    }
  }
}
