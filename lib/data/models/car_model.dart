class CarModel {
  final String model;
  final String distance;
  final double fuelCapacity;
  final double price;

  CarModel(
      {required this.model,
      required this.distance,
      required this.fuelCapacity,
      required this.price});

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
        model: map['model'],
        distance: map['distance'],
        fuelCapacity: map['fuelCapacity'],
        price: map['price']);
  }
}
