////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:shared_preferences/shared_preferences.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class Preferences{

  static late SharedPreferences _prefs;
  //valores a guardar en preferencias
  static String _name = "";
  static bool _isDarkMode = false;
  static int _gender = 1;
  //ir a main.dar a la función main para ver como se ha convertido en asincrono para usar
  //este método, que ha de inicializarse antes de poder usar la clase.
  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }
  //Setters and getters
  static String get name {
    return _prefs.getString("name")?? _name;
  }
  static set name(String name) {
    _name = name;
    _prefs.setString("name", name);
  }
  //
  static int get gender{
    return _prefs.getInt("gender") ?? _gender;
  }
  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt("gender", gender);
  }
  //
  static bool get isDarkmode{
    return _prefs.getBool("isDarkmode") ?? _isDarkMode;
  }
  static set isDarkmode(bool mode) {
    _isDarkMode = mode;
    _prefs.setBool("isDarkmode", mode);
  }
  //
}
////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Creación de una clase válida para usar en todas las pantallas
 */