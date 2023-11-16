import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<CreateThemeFromLogo>(onCreateTheme);
  }

  FutureOr<void> onCreateTheme(CreateThemeFromLogo event, Emitter<ThemeState> emit) async {
    ImageProvider imageProvider = NetworkImage(event.url);
    emit(ThemeCreated(colorScheme: await ColorScheme.fromImageProvider(provider: imageProvider)));
  }
}
