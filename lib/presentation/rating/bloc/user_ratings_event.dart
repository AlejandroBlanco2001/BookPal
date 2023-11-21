part of 'user_ratings_bloc.dart';

sealed class UserRatingsEvent extends Equatable {
  const UserRatingsEvent();

  @override
  List<Object> get props => [];
}

final class FetchUserRatings extends UserRatingsEvent {}

final class RefreshUserRatings extends UserRatingsEvent {}