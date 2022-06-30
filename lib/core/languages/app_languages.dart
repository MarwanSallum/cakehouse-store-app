import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppLanguages extends Translations{
  final List<String> availableLocales = ["ar", "en"];
  final List<String> fileList = [
    "auth", "validations"
  ];

  @override
  Map<String, Map<String, String>> get keys => loadedKeys;

  Map<String, Map<String, String>> loadedKeys = {};

  Future<AppLanguages> init() async{
    for(String locale in availableLocales){
      loadedKeys[locale] = {};
      try{
        for(String file in fileList){
          Map<String, String> translations = {};
          String data = await rootBundle.loadString("assets/languages/$locale/$file.json");
          translations.addAll(Map<String, String>.from(jsonDecode(data)));
          loadedKeys[locale]!.addAll(translations);
        }
      }catch(error){
        throw Exception("${error.toString()} Failed to load locale $locale");
      }
    }
    return this;
  }
}