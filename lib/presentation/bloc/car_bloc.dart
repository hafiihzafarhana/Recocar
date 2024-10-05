import 'package:bloc/bloc.dart';
import 'package:fg_rentcar/domain/usecases/car_usecase.dart';
import 'package:fg_rentcar/presentation/bloc/car_event.dart';
import 'package:fg_rentcar/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarUsecase getCars;
  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
