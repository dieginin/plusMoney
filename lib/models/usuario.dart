import 'dart:convert';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';

Usuario usuarioFromMap(String str) => Usuario.fromMap(json.decode(str));

String usuarioToMap(Usuario data) => json.encode(data.toMap());

class Usuario {
  final String nombre;
  final String usuario;
  final String eid;
  final String uid;

  Usuario({
    required this.nombre,
    required this.usuario,
    required this.eid,
    required this.uid,
  });

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        usuario: json["usuario"],
        eid: json["eid"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "usuario": usuario,
        "eid": eid,
        "uid": uid,
      };

  String iniciales(context) {
    Usuario usuario = Provider.of<AuthService>(context).usuario!;
    final splited = usuario.nombre.split(' ');
    return (usuario.nombre.contains(' ')) ? splited[0][0] + splited[1][0] : usuario.nombre[0] + usuario.nombre[1].toUpperCase();
  }
}
