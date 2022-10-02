import 'package:flutter/material.dart';
import 'package:plus_money/models/usuario.dart';

import 'package:plus_money/services/mongodb.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MongoDatabase.getUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Lo sentimos, hubo un error. Inténtalo de nuevo.'));
          } else {
            final usuario = Usuario.fromMap(snapshot.data!.first);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(usuario.nombre)),
                Text(usuario.iniciales(usuario)),
              ],
            );
          }
        },
      ),
    );
  }
}
