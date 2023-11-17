part of 'rating_bloc.dart';

sealed class RatingState extends Equatable {

  final Rating? rating;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const RatingState(
      {this.rating,
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});
  
  @override
  List<Object?> get props => [rating, dioError, genericError, statusCode];
}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingCreated extends RatingState {
  const RatingCreated(int statusCode, Rating rating)
      : super(statusCode: statusCode, rating: rating);

  @override
  List<Object?> get props => [statusCode, rating];
}

final class RatingUpdated extends RatingState {
  const RatingUpdated(int statusCode, Rating rating)
      : super(statusCode: statusCode, rating: rating);

  @override
  List<Object?> get props => [statusCode, rating];
}

final class RatingError extends RatingState {
  const RatingError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const RatingError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, message, genericError];
}
