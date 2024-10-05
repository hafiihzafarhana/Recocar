import 'package:fg_rentcar/data/models/car_model.dart';

abstract class CarState {}

class CarsLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<CarModel> carModels;

  CarsLoaded(this.carModels);
}

class CarsError extends CarState {
  final String message;

  CarsError(this.message);
}
