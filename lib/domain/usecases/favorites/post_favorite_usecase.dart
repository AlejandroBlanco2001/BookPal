import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/favorite.dart';
import 'package:bookpal/domain/repositories/favorite_repository.dart';

class PostFavoriteUsecase extends Usecase<DataState<Favorite>> {

  final FavoriteRepository _favoriteRepository;

  PostFavoriteUsecase(this._favoriteRepository);

  @override
  Future<DataState<Favorite>> call({Map<String,dynamic>? params}) async {
    String bookBarcode = params!['bookBarcode'];
    return await _favoriteRepository.postFavorite(bookBarcode);
  }
  
}