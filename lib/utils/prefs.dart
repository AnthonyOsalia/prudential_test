import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Pref {
  static var DB_NAME = "app_database.db";

  static Future<String> savePrefString(String key, String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key != null && str != null) {
      prefs.setString(key, str);
    } else {}

    return str;
  }

  static Future<String> saveListPrefString(String key, String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key != null && str != null) {
      prefs.setString(key, str);
    } else {}

    return str;
  }

  static Future<String> saveAddListToListPrefString(
      String key, String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key != null && str != null) {
      String st = prefs.getString(key);
      List l = List();
      if (st != null) {
        l = json.decode(st);
      }

      List l2 = json.decode(str);
      var newList = new List.from(l)..addAll(l2);
      prefs.setString(key, json.encode(newList));
    } else {}

    return str;
  }

  static Future<String> saveAddItemToListPrefString(
      String key, String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key != null && str != null) {
      String st = prefs.getString(key);
      List l = List();
      if (st != null) {
        l = json.decode(st);
      }

      var l2 = json.decode(str);
      l.add(l2);
      prefs.setString(key, json.encode(l));
    } else {}

    return str;
  }

  static Future<String> saveEditItemInListPrefString(
      String key, var item, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key != null && item != null) {
      String st = prefs.getString(key);
      List l = List();
      if (st != null) {
        l = json.decode(st);
      }

//      inde
      for (var i = 0; i < l.length; i++) {
        var a = l.elementAt(i);
        if (a[id] == item[id]) {
          l.removeAt(i);
          l.insert(i, item);

          break;
        }
      }

      /* List l2 = json.decode(str);
      var newList = new List.from(l)..addAll(l2);
      prefs.setString(key, json.encode(newList));*/

    } else {}

    return null;
  }

  static Future<String> getPrefString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String st = prefs.getString(key);
//    print("returning "+st);

    return st;
  }

  static Future<Map<String, dynamic>> getPrefStringJSON(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String st = prefs.getString(key);
    print("ststst " + st);
    Map<String, dynamic> user = json.decode(st);

    return user;
  }

  static void snack(BuildContext context, String s) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(s)));
  }

  static Future<List<dynamic>> getPrefList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var st = prefs.get(key);

    if (st != null) {
      return jsonDecode(st);
    }

    return null;
  }
}
