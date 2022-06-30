import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/storage/keys.dart';
import 'package:get/get.dart';

class AppStorage{
  late SharedPreferences _sharedPreferences;

  Future<AppStorage> init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  //// Theme Mode Store //////////////////////////////////////////
  isSavedDarkMode(){
    return _sharedPreferences.getBool(StorageKeys.darkMode) ?? false;
  }

  saveThemeMode(bool isDarkMode) async{
    await _sharedPreferences.setBool(StorageKeys.darkMode, isDarkMode);
  }

  ThemeMode getThemeMode(){
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode(){
    Get.changeThemeMode(
        isSavedDarkMode()
            ? ThemeMode.light
            : ThemeMode.dark
    );
    saveThemeMode(! isSavedDarkMode());
  }

  //// Language Store ///////////////////////////////////////////
  isEnglishLanguage(){
    return _sharedPreferences.getBool(StorageKeys.englishLanguage) ?? false;
  }

  saveLanguage(bool isEnglish) async{
    await _sharedPreferences.setBool(StorageKeys.englishLanguage, isEnglish);
  }

  Locale getLanguage(){
    return isEnglishLanguage() ?  const Locale('en') :  const Locale('ar');
  }

  void changeLanguage(){
    Get.updateLocale(isEnglishLanguage() ? const Locale('ar') : const Locale('en'));
    saveLanguage(! isEnglishLanguage());
    Get.reload();
  }

}