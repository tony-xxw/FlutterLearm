import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helloflutter/project/common/localization/xxw_string_base.dart';
import 'package:helloflutter/project/common/localization/xxw_string_en.dart';
import 'package:helloflutter/project/common/localization/xxw_string_zh.dart';

///自定义多语言实现
class XXWLocalizations {
  final Locale locale;

  XXWLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, XXWStringBase> _localizedValues = {
    'en': new XXWStringEn(),
    'zh': new XXWStringZh(),
  };

  XXWStringBase get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 XXWLocalizations
  ///获取对应的 GSYStringBase
  static XXWLocalizations of(BuildContext context) {
    return Localizations.of(context, XXWLocalizations);
  }

  ///通过 Localizations 加载当前的 XXWLocalizations
  ///获取对应的 GSYStringBase
  static XXWStringBase i18n(BuildContext context) {
    return (Localizations.of(context, XXWLocalizations) as XXWLocalizations)
        .currentLocalized;
  }
}
