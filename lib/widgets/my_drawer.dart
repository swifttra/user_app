import 'package:flutter/material.dart';
import 'package:swifttra/global/global.dart';
import 'package:swifttra/mainScreens/about_screen.dart';
import 'package:swifttra/mainScreens/payment_screen.dart';
import 'package:swifttra/mainScreens/profile_screen.dart';
import 'package:swifttra/mainScreens/trips_history_screen.dart';
import 'package:swifttra/splashScreen/splash_screen.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  String? name;
  String? email;

  MyDrawer({Key? key, this.name, this.email}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //drawer header
          Container(
            height: 165,
            color: Colors.white,
            child: DrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 255, 136, 0)),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.email.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 12.0,
          ),

          //drawer body
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => const TripsHistoryScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.orange,
              ),
              title: Text(
                "History",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const ProfileScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.orange,
              ),
              title: Text(
                "Visit Profile",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const PaymentScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.credit_card_rounded,
                color: Colors.orange,
              ),
              title: Text(
                "Payments",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const ProfileScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.volume_up_rounded,
                color: Colors.orange,
              ),
              title: Text(
                "Promotions",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const AboutScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.orange,
              ),
              title: Text(
                "About",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              fAuth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const MySplashScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.orange,
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
