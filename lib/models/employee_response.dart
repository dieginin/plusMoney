import 'dart:convert';

import 'package:plus_money/models/models.dart';

EmpleadosResponse empleadosResponseFromMap(String str) => EmpleadosResponse.fromMap(json.decode(str));

String empleadosResponseToMap(EmpleadosResponse data) => json.encode(data.toMap());

class EmpleadosResponse {
  EmpleadosResponse({
    required this.ok,
    required this.empleados,
  });

  final bool ok;
  final List<Empleado> empleados;

  factory EmpleadosResponse.fromMap(Map<String, dynamic> json) => EmpleadosResponse(
        ok: json["ok"],
        empleados: List<Empleado>.from(json["empleados"].map((x) => Empleado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "empleados": List<dynamic>.from(empleados.map((x) => x.toMap())),
      };
}
