import 'package:fg_rentcar/data/models/car_model.dart';
import 'package:fg_rentcar/domain/repositories/car_repository.dart';

class CarUsecase {
  final CarRepository repository;

  CarUsecase(this.repository);

  Future<List<CarModel>> call() async {
    return await repository.fetchCars();
  }
}
