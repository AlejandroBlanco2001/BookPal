import 'package:bloc/bloc.dart';
import 'package:bookpal/app/pages/authentication/login_page.dart';
import 'package:bookpal/app/pages/borrowed/borrowed_page.dart';
import 'package:bookpal/app/pages/favorites/favorites_page.dart';
import 'package:bookpal/app/pages/home/home_page.dart';
import 'package:bookpal/app/pages/user_profile/user_profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_pages_event.dart';
part 'navigation_pages_state.dart';

class NavigationPagesBloc extends Bloc<NavigationPagesEvent, NavigationPagesState> {
  NavigationPagesBloc() : super(const NavigationPagesInitial()) {
    on<LoggedIn>((event, emit) {emit(const NavigationPagesLoggedIn());});
    on<NotLoggedIn>((event, emit) {emit(const NavigationPagesInitial());});
  }
}
