import 'package:flutter/material.dart';

const _defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide.none,
);

const ColorScheme rickMortyScheme = ColorScheme.dark(
  primary: Color(0xff129166),
  secondary: Color(0xfffcb900),
  tertiary: Color(0xff84cc6d),
  error: Color(0xffEB5757),

  surface: Color(0xff151515),
  onSurface: Color(0xffF2F2F9),

  onSurfaceVariant: Color(0xffF2F2F9),
  outline: Color(0xffB5B5CE),

  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
);

ThemeData temaClaro(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: rickMortyScheme,
    scaffoldBackgroundColor: rickMortyScheme.surface,

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      errorStyle: TextStyle(
        color: Color(0xffEB5757),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      fillColor: Color(0xffF2F2F9),
      labelStyle: TextStyle(
        color: Color(0xff333333),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      border: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder,
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),

    extensions: const [
      RickMortyColors(
        primary: Color(0xff129166),
        secondary: Color(0xfffcb900),
        tertiary: Color(0xff84cc6d),
        error: Color(0xffEB5757),
        cardColor: Color(0xffF2F2F9),
        success: Color(0xff00FF85),
      ),
    ],
  );
}

@immutable
class RickMortyColors extends ThemeExtension<RickMortyColors> {
  const RickMortyColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.success,
    required this.cardColor,
  });

  final Color primary;
  final Color secondary;
  final Color success;
  final Color tertiary;
  final Color error;
  final Color cardColor;

  static RickMortyColors of(BuildContext context) {
    return Theme.of(context).extension<RickMortyColors>()!;
  }

  @override
  RickMortyColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? success,
    Color? cardColor,
  }) {
    return RickMortyColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      success: success ?? this.success,
      cardColor: cardColor ?? this.cardColor,
    );
  }

  @override
  RickMortyColors lerp(
    covariant ThemeExtension<RickMortyColors>? other,
    double t,
  ) {
    if (other is! RickMortyColors) return this;
    return RickMortyColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
    );
  }
}
