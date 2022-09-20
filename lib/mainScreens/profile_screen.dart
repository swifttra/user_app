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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        const Center(
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Oxygen',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            Container(
                width: 150,
                height: 150,
                alignment: Alignment.topCenter,
                child: Image.asset("images/logo.png")),

            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.grey,
                height: 0.5,
                thickness: 0.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                "${userModelCurrentInfo!.name!} ${userModelCurrentInfo!.surname!}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Oxygen',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.grey,
                height: 0.5,
                thickness: 0.5,
              ),
            ),

            const SizedBox(
              height: 8.0,
            ),
            //email
            const Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: SizedBox(
                  child: Text("Email Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey,
                        fontFamily: 'Oxygen',
                      ))),
            ),
            InfoDesignUIWidget(
              textInfo: userModelCurrentInfo!.email!,
              iconData: Icons.email_rounded,
            ),

            const SizedBox(
              width: 320,
              child: Divider(
                color: Colors.grey,
                height: 0.5,
                thickness: 0.5,
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
            //email
            const Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: SizedBox(
                  child: Text("Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey,
                        fontFamily: 'Oxygen',
                      ))),
            ),
            InfoDesignUIWidget(
              textInfo: userModelCurrentInfo!.phone!,
              iconData: Icons.phone_android_rounded,
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
