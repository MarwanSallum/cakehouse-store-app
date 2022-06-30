import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CoreTheme{
  Map<String,dynamic> themeSettings = {};
  String get fileName;
  ThemeData get themeData;

  set baseThemeData(ThemeData baseThemeData){
    this.baseThemeData = baseThemeData;
  }

  Future<CoreTheme> init() async{
    try{
      String data = await rootBundle.loadString('assets/themes/$fileName.json');
      themeSettings = Map<String,dynamic>.from( jsonDecode(data) );
    }catch(error){
      throw Exception("${error.toString()} Failed to load Theme Settings");
    }
    return this;
  }

  ThemeData buildTheme(BuildContext context){
    return themeData.copyWith(
      primaryColor: primaryColor,
      // appBarTheme: ThemeStyle.appBarTheme(color: primaryColor),
      textTheme: GoogleFonts.cairoTextTheme().apply(bodyColor: textPrimaryColor ),
      // elevatedButtonTheme: ThemeStyle.elevatedButtonTheme(primaryColor, secondaryColor),
      // inputDecorationTheme: ThemeStyle.inputDecoration(primaryColor),
    );
  }

  Color getColor({required String filed, required String name, String? shade = 'main'}){
    String value = themeSettings[filed][name][shade] ?? '#ff8d00';
    if(value.startsWith('#')){
      value = value.replaceAll('#', '');
    }
    return Color(int.tryParse("0xff$value") ?? 0xffff8d00);
  }

  Color get primaryColor => getColor(filed: 'colors', name: 'primary');

  Color get textPrimaryColor => getColor(filed: 'text',name: 'primary');


}