import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:plus_money/global/environment.dart';
import 'package:plus_money/models/models.dart';

class EmpleadosService with ChangeNotifier {
  Empleado? _empleado;
  List<Empleado>? empleados;

  Empleado get empleado => _empleado ?? Empleado(nombre: '', salario: 0, deuda: 0, eid: '', uid: '');
  set empleado(Empleado empl) {
    _empleado = empl;
    notifyListeners();
  }

  Future getUsuarios(String eid) async {
    final data = {
      'eid': eid,
    };

    final uri = Uri.parse('${Environment.apiUrl}/employee/');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final employeeResponse = empleadosResponseFromMap(resp.body);
      empleados = employeeResponse.empleados;
      notifyListeners();
    }
  }

  Future<bool> agregar(String nombre, String salario, String eid) async {
    if (nombre.isNotEmpty) nombre = _capitalizeAllWord(nombre);

    final data = {
      "nombre": nombre,
      "salario": salario,
      "deuda": 0.0,
      "eid": eid,
    };

    final uri = Uri.parse('${Environment.apiUrl}/employee/new');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      getUsuarios(eid);
      return true;
    }
    return false;
  }

  Future<bool> update(Empleado empl, String uid, String nombre, String salario, String deuda) async {
    if (nombre.isEmpty) nombre = empl.nombre;
    if (nombre.isNotEmpty) nombre = _capitalizeAllWord(nombre);
    if (salario.isEmpty) salario = empl.salario.toString();
    if (deuda.isEmpty) deuda = empl.deuda.toString();

    final data = {
      "uid": uid,
      "nombre": nombre,
      "salario": salario,
      "deuda": deuda,
    };

    final uri = Uri.parse('${Environment.apiUrl}/employee/update');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      getUsuarios(empl.eid);
      empleado = Empleado(nombre: '', salario: 0, deuda: 0, eid: empl.eid, uid: '');
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> eliminar(String uid, String eid) async {
    final data = {
      "uid": uid,
    };

    final uri = Uri.parse('${Environment.apiUrl}/employee/delete');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      getUsuarios(eid);
      empleado = Empleado(nombre: '', salario: 0, deuda: 0, eid: '', uid: '');
      notifyListeners();
      return true;
    }
    return false;
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
