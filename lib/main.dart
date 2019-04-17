import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localize/localizations.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).text('title'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.locales(),
      home: Home(),
    ));
