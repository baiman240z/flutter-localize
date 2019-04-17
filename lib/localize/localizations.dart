import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'values.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const List<String> languages = ['en', 'ja'];
  static const String _defaultLanguage = 'en';

  static List<Locale> locales() {
    final list = List<Locale>();
    languages.forEach((String val) {
      list.add(Locale(val));
    });
    return list;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String text(String key) {
    if (LOCALIZED_VALUES[locale.languageCode].containsKey(key)) {
      return LOCALIZED_VALUES[locale.languageCode][key];
    } else {
      return LOCALIZED_VALUES[_defaultLanguage][key];
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.languages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
