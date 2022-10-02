import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:plus_money/models/models.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState()) {
    on<UsuarioEvent>((event, emit) {});
  }
}
