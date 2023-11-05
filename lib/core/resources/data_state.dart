import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final int statusCode;
  final List<String>? message;
  final DioException ? error;

  const DataState({this.data, required this.statusCode, this.message, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(int statusCode, T data) : super(statusCode: statusCode, data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(int statusCode, DioException error, [List<String>? message]) : super(statusCode: statusCode, message: message, error: error);
}