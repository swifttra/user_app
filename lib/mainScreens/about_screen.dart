import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swifttra/mainScreens/main_screen.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //image
          Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/car_logo.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [
              //company name
              const Text(
                "About Swifttra",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 136, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //about you & your company - write some info
              const Text(
                "SwiftTra Ltd is an indigenous company with global standards."
                "SwiftTra is a high technology service for ride-hailing, booking easy rides"
                "that enables you to get transport to any destination. SwiftTra operates a mobile app,"
                "ride-hailing, vehicles for hire, food delivery, package delivery, school runs, couriers & haulage."
                "The app works Worldwide. Request taxi ride service and enjoy your trip!"
                "SwiftTra’s mission is to bring safe, fast, reliable, affordable and comfortable transportation to"
                "millions of people around the world, while also helping thousands of drivers support their families."
                "Our vision is to be world-class brand known for its innovation, efficiency and reliability in the market.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //close
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 136, 0),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
