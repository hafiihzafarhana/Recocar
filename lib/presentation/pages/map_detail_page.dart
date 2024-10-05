import 'package:fg_rentcar/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailPage extends StatelessWidget {
  final CarModel carModel;
  const MapDetailPage({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      // Stack berfungsi untuk menyususn widget secara bertumpuk
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter:
                  LatLng(-7.375756, 112.609402), // Center over a valid location
              initialZoom: 9, // Use an integer value for zoom
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailCard(carModel),
          )
        ],
      ),
    );
  }
}

Widget carDetailCard(CarModel carModel) {
  return SizedBox(
    height: 375,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // mengambil lebar penuh berdasarkan induknya
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                carModel.model,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "> ${carModel.distance} km",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${carModel.fuelCapacity} L",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Feature",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                featureIcons(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${carModel.price}/day",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 70, right: 10, child: Image.asset("assets/white_car.png"))
      ],
    ),
  );
}

Widget featureIcons() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal, // Mengizinkan gulir horizontal
    child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 5.0), // Menambahkan padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Memulai dari kiri
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          featureIcon(Icons.local_gas_station, "Diesel", "Common Rail"),
          featureIcon(Icons.speed, "Acceleration", "0-100km/s"),
          featureIcon(Icons.ac_unit, "Cold", "Temp Control"),
        ],
      ),
    ),
  );
}

Widget featureIcon(IconData icon, String title, String subTitle) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2),
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      children: [
        Icon(icon, size: 28),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    ),
  );
}
