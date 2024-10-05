import 'package:fg_rentcar/data/models/car_model.dart';
import 'package:fg_rentcar/presentation/pages/map_detail_page.dart';
import 'package:fg_rentcar/presentation/widgets/car_card_widget.dart';
import 'package:fg_rentcar/presentation/widgets/more_card_widget.dart';
import 'package:flutter/material.dart';

class CarDetailPage extends StatefulWidget {
  final CarModel carModel;
  const CarDetailPage({super.key, required this.carModel});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 5),
            Text('Information'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCardWidget(
            carModel: CarModel(
                model: widget.carModel.model,
                distance: widget.carModel.distance,
                fuelCapacity: widget.carModel.fuelCapacity,
                price: widget.carModel.price),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/user.png"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Hafi Ihza Farhana",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$4.253",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapDetailPage(carModel: widget.carModel)));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/maps.png"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation?.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/maps.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                MoreCardWidget(
                  carModel: CarModel(
                      model: widget.carModel.model,
                      distance: widget.carModel.distance,
                      fuelCapacity: widget.carModel.fuelCapacity,
                      price: widget.carModel.price),
                ),
                const SizedBox(height: 5),
                // MoreCardWidget(
                //   carModel: CarModel(
                //       model: "Fortuner GR",
                //       distance: "870",
                //       fuelCapacity: 50,
                //       price: 45),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
