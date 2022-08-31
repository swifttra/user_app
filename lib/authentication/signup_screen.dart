import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swifttra/authentication/login_screen.dart';
import 'package:swifttra/global/global.dart';
import 'package:swifttra/splashScreen/splash_screen.dart';
import 'package:swifttra/widgets/progress_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController surnameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    } else if (surnameTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Your surname ");
    } else if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone Number is required.");
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be atleast 6 Characters.");
    } else {
      saveUserInfoNow();
    }
  }

  saveUserInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: $msg");
    }))
        .user;

    if (firebaseUser != null) {
      Map userMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "surname": surnameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };

      DatabaseReference reference =
          FirebaseDatabase.instance.ref().child("users");
      reference.child(firebaseUser.uid).set(userMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account has been Created.");
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been Created.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(55.0),
                child: Image.asset("images/logo.png"),
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameTextEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "First name",
                  hintText: "First name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: surnameTextEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Surname",
                  hintText: "Surname",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Phone",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    validateForm();
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orangeAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "OR",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                child: const Text(
                  "Already have an Account? Sign IN Here",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
