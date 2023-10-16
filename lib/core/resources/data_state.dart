import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final int statusCode;
  final DioException ? error;

  const DataState({this.data, required this.statusCode, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(int statusCode, T data) : super(statusCode: statusCode, data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(int statusCode, DioException error) : super(statusCode: statusCode, error: error);
}