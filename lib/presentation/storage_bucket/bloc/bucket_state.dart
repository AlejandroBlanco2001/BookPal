part of 'bucket_bloc.dart';

sealed class BucketState extends Equatable {

  final String? downloadUrl;
  final dynamic error;

  const BucketState({this.downloadUrl, this.error});
  
  @override
  List<Object?> get props => [downloadUrl, error];
}

final class BucketInitial extends BucketState {}

final class DownloadUrlLoading extends BucketState {}

final class DownloadedUrl extends BucketState {

  const DownloadedUrl(String downloadUrl) : super(downloadUrl: downloadUrl);

  @override
  List<Object?> get props => [downloadUrl];
}

final class DownloadUrlError extends BucketState {
  const DownloadUrlError(dynamic error) : super(error: error);
}
