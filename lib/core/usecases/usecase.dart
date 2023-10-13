

abstract class Usecase<T> {
  Future<T> call({Map<String, dynamic>? params});
}