part of 'rating_bloc.dart';

sealed class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

final class RateBook extends RatingEvent {
  final String barcode;
  final double rating;

  const RateBook(this.barcode, this.rating);

  @override
  List<Object> get props => [barcode, rating];
}

final class UpdateRating extends RatingEvent {
  final int id;
  final double rating;

  const UpdateRating(this.id, this.rating);

  @override
  List<Object> get props => [id, rating];
}
