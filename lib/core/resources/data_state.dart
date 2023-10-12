import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final DioException ? error;

  const DataState({this.data, this.error});
}

class DataSucess<T> extends DataState<T> {
  const DataSucess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}