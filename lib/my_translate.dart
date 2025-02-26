import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/locale_keys.dart';

class MyTranslate extends StatelessWidget {
  const MyTranslate({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tr("hello")), // ใช้ `.tr()` ตรง ๆ เพื่อให้รองรับการเปลี่ยนภาษา
          Text(tr("welcome-name", args: ["Everyone"])),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text(tr("add"))),
              ElevatedButton(onPressed: () {}, child: Text(tr("cancel"))),
              ElevatedButton(onPressed: () {}, child: Text(tr("save"))),
            ],
          ),
        ],
      ),
    );
  }
}
