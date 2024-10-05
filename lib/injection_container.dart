import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_rentcar/data/datasources/firebase_car_datasource.dart';
import 'package:fg_rentcar/data/repositories/car_repository_imp.dart';
import 'package:fg_rentcar/domain/repositories/car_repository.dart';
import 'package:fg_rentcar/domain/usecases/car_usecase.dart';
import 'package:fg_rentcar/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

/*
  firebase = getIt(FIrebase)
  |
  v
  FirebaseCarDatasource = getIt(firebase), ini adalah FirebaseCarDatasource(firebase)
  |
  v
  CarRepositoryImp = getIt(FirebaseCarDatasource), ini adalah CarRepositoryImp(FirebaseCarDatasource(firebase))
  |
  v
  CarUsecase = getIt(CarRepositoryImp), ini adalah CarUsecase(CarRepositoryImp(FirebaseCarDatasource(firebase)))
*/

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImp(getIt<FirebaseCarDataSource>()));

    getIt.registerLazySingleton<CarUsecase>(
        () => CarUsecase(getIt<CarRepository>()));

    getIt.registerFactory(() => CarBloc(getCars: getIt<CarUsecase>()));
  } catch (e) {
    throw e;
  }
}
