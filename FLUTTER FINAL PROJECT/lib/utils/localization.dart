import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const List<LocalizationsDelegate<dynamic>> localizationDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> supportedLocales = [
  Locale('en', 'US'),
  Locale('es', 'ES'), // Add more languages if needed
];
