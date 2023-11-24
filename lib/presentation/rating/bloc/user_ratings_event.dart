part of 'user_ratings_bloc.dart';

sealed class UserRatingsEvent extends Equatable {
  const UserRatingsEvent();

  @override
  List<Object> get props => [];
}

final class FetchUserRatings extends UserRatingsEvent {}

final class RefreshUserRatings extends UserRatingsEvent {}

final class UpdateRating extends UserRatingsEvent {
  final int ratingId;
  final double rating;
  
  const UpdateRating(this.ratingId, this.rating);

  @override
  List<Object> get props => [ratingId];
}

final class RateBook extends UserRatingsEvent {
  final String barcode;
  final double rating;

  const RateBook(this.barcode, this.rating);

  @override
  List<Object> get props => [barcode, rating];
}

final class DisposeUserRatings extends UserRatingsEvent {}