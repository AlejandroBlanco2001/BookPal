part of 'bucket_bloc.dart';

sealed class BucketEvent extends Equatable {
  const BucketEvent();

  @override
  List<Object> get props => [];
}

final class GetDownloadUrl extends BucketEvent {
  final String path;

  const GetDownloadUrl(this.path);

  @override
  List<Object> get props => [path];
}
