import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/domain/repositories/rating_repository.dart';

class RateBookUsecase extends Usecase<DataState<Rating>> {

  final RatingRepository _ratingRepository;

  RateBookUsecase(this._ratingRepository);

  @override
  Future<DataState<Rating>> call({Map<String, dynamic>? params}) {
    Map<String,dynamic> fields = params!['fields'];
    return _ratingRepository.postRating(fields);
  }
}