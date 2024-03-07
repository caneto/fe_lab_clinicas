import 'package:flutter/material.dart';
import 'package:mix_poc/pages/login_page.dart';
import 'package:mix_poc/style/base_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: BaseStyle.orangeColor,
      style: BorderStyle.solid
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: BaseStyle.lightOrangeColor),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: BaseStyle.lightOrangeColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: BaseStyle.lightOrangeColor,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: BaseStyle.orangeColor,
            fontWeight: FontWeight.w700,
          ),
          floatingLabelStyle: const TextStyle(
              color: BaseStyle.blueColor, fontWeight: FontWeight.w600),
          border: _defaultInputBorder,
          enabledBorder: _defaultInputBorder.copyWith(
            borderSide: const BorderSide(color: BaseStyle.blueColor),
          ),
          focusedBorder: _defaultInputBorder,
          errorBorder: _defaultInputBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: BaseStyle.blueColor,
          ),
          foregroundColor: BaseStyle.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: BaseStyle.blueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
