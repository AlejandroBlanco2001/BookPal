import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const InHomePage()) {
    on<SwapPage>(switchIndex);
    on<ToHomePage>((event, emit) => emit(const InHomePage()));
  }

  FutureOr<void> switchIndex(SwapPage event, Emitter<NavigationState> emit) {
    switch (event.index) {
      case 0:
        emit(const InHomePage());
        break;
      case 1:
        emit(const InBorrowedPage());
        break;
      case 2:
        emit(const InFavoritesPage());
        break;
      case 3:
        emit(const InProfilePage());
        break;
      default:
    }
  }
}
