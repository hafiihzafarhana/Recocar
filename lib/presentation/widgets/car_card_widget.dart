import 'package:fg_rentcar/data/models/car_model.dart';
import 'package:fg_rentcar/presentation/pages/car_detail_page.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel carModel;
  const CarCardWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailPage(
                      carModel: carModel,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/car_image.png",
              height: 120,
            ),
            Text(
              carModel.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/gps.png"),
                        const SizedBox(width: 5),
                        Text("${carModel.distance.toString()} km"),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Image.asset("assets/pump.png"),
                        const SizedBox(width: 5),
                        Text("${carModel.fuelCapacity.toString()} L"),
                      ],
                    )
                  ],
                ),
                Text(
                  "\$ ${carModel.price.toString()} /h",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
