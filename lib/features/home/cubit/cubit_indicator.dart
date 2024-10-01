import 'package:bloc/bloc.dart';


class CubitIndicator extends Cubit<bool> {
  CubitIndicator(bool initialState) : super(initialState);

  Future<void> activateIndicator() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(true); // Activa el indicador después de 2 segundos
  }

  Future<void> deactivateIndicator() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(false); // Desactiva el indicador después de 2 segundos
  }

  Future<void> toggleIndicator() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(!state); // Alterna el estado actual después de 2 segundos
  }
}