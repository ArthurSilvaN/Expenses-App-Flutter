import 'package:flutter/material.dart';

import '../entities/languages.dart';

class LanguagesModel extends Languages {
  LanguagesModel({
    required String flag,
    required String languageName,
    required Color color,
    required Locale locale,
  }) : super(
          flag: flag,
          languageName: languageName,
          locale: locale,
          color: color,
        );

  factory LanguagesModel.fromMap(Map<String, dynamic> map) => LanguagesModel(
        flag: map['flag'] as String,
        languageName: map['languageName'] as String,
        color: map['color'] as Color,
        locale: map['locale'] as Locale,
      );

  Map<String, dynamic> toMap() {
    return {
      'flag': flag,
      'languageName': languageName,
      'locale': locale,
      'color': color,
    };
  }
}
