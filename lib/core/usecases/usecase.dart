
import 'package:bookpal/core/resources/data_state.dart';

abstract class Usecase<T, Params> {
  Future<DataState<T>> call({Params params});
}