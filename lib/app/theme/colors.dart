part of 'style.dart';

const _colorScheme = ColorScheme(
  primary: ColorTheme.primary,
  onPrimary: Colors.white,
  secondary: Colors.deepOrange,
  onSecondary: Colors.amberAccent,
  error: Colors.red,
  onError: Colors.red,
  background: Colors.amberAccent,
  onBackground: Colors.amberAccent,
  surface: Colors.amberAccent,
  onSurface: Colors.amberAccent,
  brightness: Brightness.light,
);

const _colorDarkScheme = ColorScheme(
  primary: Colors.purple,
  onPrimary: Color.fromARGB(255, 107, 93, 93),
  secondary: Color.fromARGB(255, 138, 57, 32),
  onSecondary: Color.fromARGB(255, 80, 73, 49),
  error: Color.fromARGB(255, 114, 51, 47),
  onError: Color.fromARGB(255, 114, 48, 44),
  background: Colors.amberAccent,
  onBackground: Colors.amberAccent,
  surface: Colors.amberAccent,
  onSurface: Colors.amberAccent,
  brightness: Brightness.dark,
);

class ColorTheme {
  static const Color primary = Color(0xffff941a);
}
