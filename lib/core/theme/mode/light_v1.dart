import 'package:flutter/material.dart';
import 'package:store_app/core/theme/theme.dart';

// Light mode version 1
class LightModeVersion1 extends CoreTheme{
  @override
  String get fileName => 'light_v1';

  @override
  ThemeData get themeData => ThemeData.light();
}