import 'package:fg_rentcar/data/models/car_model.dart';

// ini akan menjadi interface, dan akan diimplementkan di models/repositories
// tujuanya agar konsisten
abstract class CarRepository {
  // Future untuk operasi asinkronous
  Future<List<CarModel>> fetchCars();
}
