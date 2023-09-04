// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

///Extensions for the BuildContext API
///```dart
///
/// Widget build(BuildContext context){
///
///   final width = context.width;
///
///
///
///   ...
/// }
///
///```
extension SizeExtensions on BuildContext {
  Size getSize() => MediaQuery.of(this).size;
  double get width => getSize().width;
  double get height => getSize().height;

  double get availableHeight {
    MediaQueryData media = MediaQuery.of(this);
    double paddingTop = media.padding.top;
    //   double insets = media.viewInsets.top;
    return height - (paddingTop + kToolbarHeight);
  }

  bool get isKeyboardOpened => MediaQuery.of(this).viewInsets.bottom != 0;
}

///Ease navigation. Example
///```dart
/// ElevatedButton(
///   onPressed: ()=>context.push(SettingsPage())
///   child:Text('To Settings')
/// )
///
///```
extension ZuriwerkNavigation on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacement<T extends Object?>(Widget page) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return Navigator.of(this)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => page), (route) {
      return false;
    });
  }
}

///For Text styling!
extension ThemeExtension on BuildContext {
  //`this` keyword refers to BuildContext instance
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  AppBarTheme? get appBarTheme => Theme.of(this).appBarTheme;
  Color? get backgroundColor => Theme.of(this).backgroundColor;
  CardTheme? get cardTheme => Theme.of(this).cardTheme;
  ButtonThemeData? get buttonTheme => Theme.of(this).buttonTheme;

  TextStyle? get errorBody =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(color: Colors.white);
}

extension SnackbarExtension on BuildContext {
  Future<void> snackbar(
      {required String text,
      Function? onFinished,
      Color? color,
      Duration duration = const Duration(milliseconds: 1300)}) async {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(text),
      duration: duration,
      backgroundColor: color,
    ));
    Future.delayed(duration, () {
      if (onFinished != null) {
        onFinished();
      }
    });
  }
}
