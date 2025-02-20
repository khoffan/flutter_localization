import 'package:app_translate/l10n/l10n.dart';
import 'package:app_translate/translate_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ValueNotifier<Locale> lang = ValueNotifier<Locale>(Locale("en"));

  void changeLang(Locale locale) {
    print(lang.value);
    lang.value = locale;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: lang,
      builder: (context, locale, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10nLang.all,
          locale: locale,
          home: TranslatePage(changeLang: changeLang),
        );
      },
    );
  }
}
