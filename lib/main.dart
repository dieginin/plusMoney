import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plus_money/blocs/bloc.dart';
import 'package:plus_money/routes/routes.dart';
import 'package:plus_money/services/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MongoDatabase.connect();

  runApp(const PlusMoneyApp());
}

class PlusMoneyApp extends StatelessWidget {
  const PlusMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsuarioBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '+Money',
        initialRoute: 'home',
        routes: appRoutes,
      ),
    );
  }
}
