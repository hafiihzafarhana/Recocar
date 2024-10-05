import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_rentcar/data/models/car_model.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<CarModel>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}
