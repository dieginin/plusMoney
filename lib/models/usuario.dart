import 'package:mongo_dart/mongo_dart.dart';

class Usuario {
  final String nombre;
  final String email;
  final ObjectId uid;
  final String eid;

  Usuario({
    required this.nombre,
    required this.email,
    required this.uid,
    required this.eid,
  });

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "email": email,
        "_id": uid,
        "eid": eid,
      };

  factory Usuario.fromMap(Map<String, dynamic> map) => Usuario(
        nombre: map["nombre"],
        email: map["email"],
        uid: map["_id"],
        eid: map["eid"],
      );

  String iniciales(Usuario usuario) {
    final splited = usuario.nombre.split(' ');
    return (usuario.nombre.contains(' ')) ? splited[0][0] + splited[1][0] : usuario.nombre[0] + usuario.nombre[1].toUpperCase();
  }
}
