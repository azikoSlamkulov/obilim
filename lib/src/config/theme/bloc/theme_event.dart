part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final bool isDark;

  const ThemeChanged(this.isDark);
}

class ThemeInitial extends ThemeEvent {
  final String initialTheme;

  const ThemeInitial(this.initialTheme);
}
