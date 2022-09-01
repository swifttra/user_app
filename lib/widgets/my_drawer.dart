import 'package:flutter/material.dart';
import 'package:swifttra/global/global.dart';
import 'package:swifttra/mainScreens/profile_screen.dart';
import 'package:swifttra/mainScreens/trips_history_screen.dart';
import 'package:swifttra/splashScreen/splash_screen.dart';
import '../mainScreens/payment_screen.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  String? name;
  String? surname;
  String? email;

  MyDrawer({Key? key, this.surname, this.name, this.email}) : super(key: key);

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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 191, 0),
                    Color.fromARGB(255, 255, 140, 0),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
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
                        widget.surname.toString(),
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
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Ride History",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const SizedBox(
            height: 12.0,
          ),

          //drawer body
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const PaymentScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.money,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Payments",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const Divider(
            height: 1,
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            thickness: 0.2,
            color: Colors.grey,
          ),

          const SizedBox(height: 16.0),

          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.handshake,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Promotions",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const Divider(
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            height: 1,
            thickness: 0.2,
            color: Colors.grey,
          ),

          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const ProfileScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const Divider(
            height: 1,
            thickness: 0.2,
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: Colors.grey,
          ),

          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const Divider(
            height: 1,
            thickness: 0.2,
            color: Colors.grey,
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
          ),

          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "About Swifttra",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          const Divider(
            height: 1,
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            thickness: 0.2,
            color: Colors.grey,
          ),

          const SizedBox(height: 257.0),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                fAuth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const MySplashScreen()));
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(15.0),
                          ))),
              child: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
