import 'package:fg_rentcar/data/datasources/firebase_car_datasource.dart';
import 'package:fg_rentcar/data/models/car_model.dart';
import 'package:fg_rentcar/domain/repositories/car_repository.dart';

class CarRepositoryImp implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImp(this.dataSource);

  @override
  Future<List<CarModel>> fetchCars() {
    return dataSource.getCars();
  }
}
