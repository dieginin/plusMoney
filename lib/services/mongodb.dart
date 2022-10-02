import 'package:mongo_dart/mongo_dart.dart';

import 'package:plus_money/global/environment.dart';
import 'package:plus_money/models/models.dart';

class MongoDatabase {
  static dynamic db, userCollection;

  static connect() async {
    db = await Db.create(mongoConnUrl);
    await db.open();
    userCollection = db.collection(userCollection);
  }

  static Future<List<Map<String, dynamic>>> getUsuarios() async {
    try {
      return await userCollection.find().toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  static insertarUsuario(Usuario usuario) async => await userCollection.insertAll([usuario.toMap()]);

  static actualizarUsuario(Usuario usuario) async {
    var u = await userCollection.findOne({'uid': usuario.uid});

    u['nombre'] = usuario.nombre;
    u['email'] = usuario.email;
    u['uid'] = usuario.uid;
    u['eid'] = usuario.eid;

    await userCollection.save(u);
  }
}
