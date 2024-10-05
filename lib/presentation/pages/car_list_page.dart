import 'package:fg_rentcar/presentation/bloc/car_bloc.dart';
import 'package:fg_rentcar/presentation/bloc/car_state.dart';
import 'package:fg_rentcar/presentation/widgets/car_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your motor"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.carModels.length,
              itemBuilder: (context, index) {
                return CarCardWidget(carModel: state.carModels[index]);
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Text('Error : ${state.message}'),
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("No cars available")],
            );
          }
        },
      ),
    );
  }
}
