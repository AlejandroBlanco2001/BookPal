import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/domain/repositories/rating_repository.dart';

class GetUserRatingsUsecase extends Usecase<DataState<List<Rating>>> {

  final RatingRepository _ratingRepository;

  GetUserRatingsUsecase(this._ratingRepository);

  @override
  Future<DataState<List<Rating>>> call({void params}) async {
    return await _ratingRepository.getUserRatings();
  }

}