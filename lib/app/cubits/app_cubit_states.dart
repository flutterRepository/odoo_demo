import 'package:equatable/equatable.dart';

import 'package:odoo_demo/domain/model/data_model.dart';

abstract class AppCubitStates extends Equatable {
  ///? Class à étendre pour les gérer les states
}

class InitialState extends AppCubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppCubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppCubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppCubitStates {
  final List<DataModel> places;
  LoadedState({
    required this.places,
  });
  @override
  List<Object> get props => [places];
}

class DetailState extends AppCubitStates {
  final DataModel place;
  DetailState({
    required this.place,
  });
  @override
  List<Object> get props => [place];
}
