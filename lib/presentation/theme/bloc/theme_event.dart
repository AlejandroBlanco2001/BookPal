part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class CreateThemeFromLogo extends ThemeEvent {
  final String url;

  const CreateThemeFromLogo(this.url);
}
