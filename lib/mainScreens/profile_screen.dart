import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:swifttra/global/global.dart';
import 'package:swifttra/mainScreens/main_screen.dart';
import 'package:swifttra/widgets/info_design_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor:
            const Color.fromARGB(255, 255, 136, 0).withOpacity(1.0),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
              child: Image.asset("images/city.png"),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(141, 0, 3, 2),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //name
                  Text(
                    userModelCurrentInfo!.name!,
                    style: const TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                    width: 200,
                    child: Divider(
                      color: Colors.white,
                      height: 2,
                      thickness: 2,
                    ),
                  ),

                  const SizedBox(
                    height: 38.0,
                  ),

                  //phone
                  InfoDesignUIWidget(
                    textInfo: userModelCurrentInfo!.phone!,
                    iconData: Icons.phone_iphone,
                  ),

                  //email
                  InfoDesignUIWidget(
                    textInfo: userModelCurrentInfo!.email!,
                    iconData: Icons.email,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const MainScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 136, 0),
                    ),
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
