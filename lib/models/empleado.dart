import 'dart:convert';

Empleado empleadoFromMap(String str) => Empleado.fromMap(json.decode(str));

String empleadoToMap(Empleado data) => json.encode(data.toMap());

class Empleado {
  final String nombre;
  final int salario;
  final int deuda;
  final String eid;
  final String uid;

  Empleado({
    required this.nombre,
    required this.salario,
    required this.deuda,
    required this.eid,
    required this.uid,
  });

  factory Empleado.fromMap(Map<String, dynamic> json) => Empleado(
        nombre: json["nombre"],
        salario: json["salario"],
        deuda: json["deuda"],
        eid: json["eid"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "salario": salario,
        "deuda": deuda,
        "eid": eid,
        "uid": uid,
      };
}
