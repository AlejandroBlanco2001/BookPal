part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {

  final ColorScheme? colorScheme;

  const ThemeState({this.colorScheme });
  
  @override
  List<Object?> get props => [colorScheme];
}

final class ThemeInitial extends ThemeState {}

final class ThemeCreated extends ThemeState {

  const ThemeCreated({required ColorScheme colorScheme}) : super(colorScheme: colorScheme);

  @override
  List<Object?> get props => [colorScheme];
}
