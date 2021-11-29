import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:odoo_demo/app/cubits/app_cubit_states.dart';
import 'package:odoo_demo/domain/model/data_model.dart';
import 'package:odoo_demo/infrastructure/services/data_services.dart';

class AppCubits extends Cubit<AppCubitStates> {
  final DataServices data;
  AppCubits({
    required this.data,
  }) : super(InitialState()) {
    emit(WelcomeState());
  }

  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {}
  }

  detailPlace({required DataModel place}) {
    emit(
      DetailState(
        place: place,
      ),
    );
  }

  goHome() {
    emit(LoadedState(places: places));
  }
}
