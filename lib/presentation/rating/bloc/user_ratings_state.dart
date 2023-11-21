part of 'user_ratings_bloc.dart';

sealed class UserRatingsState extends Equatable {
  final List<RatingModel>? userRatings;
  final int? statusCode;
  final List<String>? message;
  final dynamic error;
  final DioException? dioException;

  const UserRatingsState({
    this.userRatings,
    this.statusCode,
    this.message,
    this.error,
    this.dioException,
  });

  @override
  List<Object?> get props =>
      [userRatings, statusCode, message, error, dioException];
}

final class UserRatingsInitial extends UserRatingsState {}

final class FetchingUserRatings extends UserRatingsState {}

final class UserRatingsFetched extends UserRatingsState {
  const UserRatingsFetched(int statusCode, List<RatingModel> userRatings)
      : super(statusCode: statusCode, userRatings: userRatings);

  @override
  List<Object?> get props => [statusCode, userRatings];
}

final class UserRatingsError extends UserRatingsState {
  const UserRatingsError(DioException dioException,
      [int? statusCode, List<String>? message])
      : super(
            statusCode: statusCode,
            dioException: dioException,
            message: message);
  const UserRatingsError.fromGenericError(dynamic error)
      : super(error: error);

  @override
  List<Object?> get props => [statusCode, dioException, message, error];
}
