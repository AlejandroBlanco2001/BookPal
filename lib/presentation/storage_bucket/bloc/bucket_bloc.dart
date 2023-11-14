import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'bucket_event.dart';
part 'bucket_state.dart';

class BucketBloc extends Bloc<BucketEvent, BucketState> {
  BucketBloc() : super(BucketInitial()) {
    on<GetDownloadUrl>(onGetDownloadUrl);
  }

  FutureOr<void> onGetDownloadUrl(GetDownloadUrl event, Emitter<BucketState> emit) async {
    emit(DownloadUrlLoading());
    try {
      final downloadUrl = await getIt.get<Reference>().child(event.path).getDownloadURL();
      switch (Utilities.getFolder(event.path)) {
        case "companies":
          emit(GotCompanyDownloadUrl(downloadUrl));
          break;
        case "users":
          emit(GotUserDownloadUrl(downloadUrl));
          break;
        case "books":
          emit(GotBookDownloadUrl(downloadUrl));
          break;
        default:
      }
    } catch (e) {
      emit(DownloadUrlError(e));
    }
  }
}