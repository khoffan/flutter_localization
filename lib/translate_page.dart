import 'package:app_translate/core/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/locale_keys.dart';

class TranslatePage extends StatefulWidget {
  TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  bool isThai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.welcome_name.tr(args: ["Guys"])),
        actions: [
          IconButton(
            onPressed: () async {
              isThai = !isThai;
              await context.setLocale(
                isThai ? AppLocalizations.thLocale : AppLocalizations.engLocale,
              );

              setState(() {});
            },
            icon: Icon(Icons.language_outlined),
          ),
        ],
      ),
      body: const MyTranslate(),
    );
  }
}

class MyTranslate extends StatelessWidget {
  const MyTranslate({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr(LocaleKeys.hello),
          ), // ใช้ `.tr()` ตรง ๆ เพื่อให้รองรับการเปลี่ยนภาษา
          Text(LocaleKeys.welcome_name.tr(args: ["Everyone"])),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text(tr(LocaleKeys.add))),
              ElevatedButton(
                onPressed: () {},
                child: Text(tr(LocaleKeys.cancel)),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(tr(LocaleKeys.save)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
