import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

final deepBlue = '040D27'.toColor();
final deepBlueSecondary = '132147'.toColor();
final electricBlue = '2C5BED'.toColor();
final lightGrey = 'F0F0F0'.toColor();

final darkTheme = ThemeData(
  accentColor: electricBlue,
  cardColor: deepBlueSecondary,
  primaryColor: deepBlue,
  primaryColorDark: deepBlue,
  backgroundColor: deepBlue,
  scaffoldBackgroundColor: deepBlue,
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'jetbrains-mono'),
  iconTheme: IconThemeData(color: Colors.white.withOpacity(0.7)),
  dialogTheme: DialogTheme(
    backgroundColor: deepBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: deepBlue,
  ),
  fontFamily: 'Jetbrains-Mono'
);