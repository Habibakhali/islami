import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderSetting extends ChangeNotifier{
  String currLang='en';
  ThemeMode current_theme=ThemeMode.light;
  void changeTheme(ThemeMode v){
    if(current_theme==v)return;
    current_theme=v;
    notifyListeners();
      }
  void changeLang(String lang){
    if(currLang==lang)
      return;
    currLang=lang;
    notifyListeners();
  }
}