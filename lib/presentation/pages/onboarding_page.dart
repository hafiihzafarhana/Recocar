import 'package:fg_rentcar/presentation/pages/car_list_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  void _handleOnPressed() {
    // lebih cocok untuk menggunakan ini, agar menghilangkan komponen tumpukan yang awal
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => CarListPage()),
        (route) => false);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => CarListPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xff2c2b34),
      body: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/onboarding.png"),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Premium motor, \nEnjoy the luxury",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Premium and luxury car daily rental, \nExperience the thrill at a lower price",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 320,
                    height: 54,
                    child: ElevatedButton(
                        onPressed: _handleOnPressed,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
