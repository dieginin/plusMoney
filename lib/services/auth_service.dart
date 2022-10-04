import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:plus_money/global/environment.dart';
import 'package:plus_money/models/models.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;

  final _storage = const FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool v) {
    _autenticando = v;
    notifyListeners();
  }

  // getters del token de forma estática
  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token!;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future login(String user, String password) async {
    autenticando = true;

    final data = {
      'usuario': user,
      'password': password,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromMap(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);
      return true;
    }
    final respBody = jsonDecode(resp.body);
    return respBody['msg'];
  }

  Future register(String nombre, String user, String password, String? eid) async {
    autenticando = true;

    if (eid!.isEmpty) {
      String number = "";
      for (var i = 0; i < 10; i++) {
        number += Random().nextInt(9).toString();
      }
      eid = number;
    }

    if (nombre.isNotEmpty) nombre = _capitalizeAllWord(nombre);

    final data = {
      'nombre': nombre,
      'usuario': user,
      'password': password,
      'eid': eid,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/new');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    autenticando = false;

    if (resp.statusCode == 200) {
      final registerResponse = loginResponseFromMap(resp.body);
      usuario = registerResponse.usuario;
      await _guardarToken(registerResponse.token);

      return true;
    }
    final respBody = jsonDecode(resp.body);
    return respBody['msg'];
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    final uri = Uri.parse('${Environment.apiUrl}/login/renew');
    final resp = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': '$token',
      },
    );

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromMap(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);
      return true;
    }
    deleteToken();
    return false;
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  String _capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }
}
