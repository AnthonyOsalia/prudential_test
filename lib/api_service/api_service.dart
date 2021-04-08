import 'dart:convert';
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:prudential_test/utils/prefs.dart';

class ApiService {
  static String host = "";

  static Future<http.Response> get(var url, {bool with_auth = true}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (with_auth) {
      // String token = await Pref.getPrefString(Keys.token);
      String token = "";
      headers['Authorization'] = 'Bearer $token';
    }

    var res = await http.get('$host$url', headers: headers);
    return res;
  }

  Future<http.Response> delete(var url, {bool with_auth = true}) async {
    var box = GetStorage();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (with_auth) {
      // String token = await Pref.getPrefString(Keys.token);
      String token = "";
      headers['Authorization'] = 'Bearer $token';
    }

    var res = await http.delete('$host$url', headers: headers);
    return res;
  }

  static Future<http.Response> post(var url, var body,
      {bool with_auth = true}) async {
    var box = GetStorage();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (with_auth) {
      // String token = await Pref.getPrefString(Keys.token);
      String token = "";
      headers['Authorization'] = 'Bearer $token';
    }

    var res =
        await http.post('$host$url', body: json.encode(body), headers: headers);
    return res;
  }

  static Future<http.Response> put(var url, var body,
      {bool with_auth = true}) async {
    var box = GetStorage();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (with_auth) {
      // String token = await Pref.getPrefString(Keys.token);
      String token = "";
      headers['Authorization'] = 'Bearer $token';
    }

    var res =
        await http.put('$host$url', body: json.encode(body), headers: headers);
    return res;
  }

  static Future<http.Response> patch(var url, var body,
      {bool with_auth = true}) async {
    var box = GetStorage();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (with_auth) {
      // String token = await Pref.getPrefString(Keys.token);
      String token = "";
      headers['Authorization'] = 'Bearer $token';
    }
    var res = await http.patch('$host$url',
        body: json.encode(body), headers: headers);
    return res;
  }
}
