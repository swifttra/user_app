import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:swifttra/global/global.dart';
import 'package:swifttra/mainScreens/main_screen.dart';

// ignore: must_be_immutable
class RateDriverScreen extends StatefulWidget {
  String? assignedDriverId;

  RateDriverScreen({Key? key, this.assignedDriverId}) : super(key: key);

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: Colors.orangeAccent,
        child: Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                child: const Text(
                  "Rate Your Trip Experience",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Oxygen',
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              const Divider(
                height: 4.0,
                thickness: 4.0,
                color: Colors.orangeAccent,
              ),
              const SizedBox(
                height: 22.0,
              ),
              SmoothStarRating(
                rating: countRatingStars,
                allowHalfRating: false,
                starCount: 5,
                color: Colors.orangeAccent,
                borderColor: Colors.orangeAccent,
                size: 46,
                onRatingChanged: (valueOfStarsChoosed) {
                  countRatingStars = valueOfStarsChoosed;

                  if (countRatingStars == 1) {
                    setState(() {
                      titleStarsRating = "Very Bad";
                    });
                  }
                  if (countRatingStars == 2) {
                    setState(() {
                      titleStarsRating = "Bad";
                    });
                  }
                  if (countRatingStars == 3) {
                    setState(() {
                      titleStarsRating = "Good";
                    });
                  }
                  if (countRatingStars == 4) {
                    setState(() {
                      titleStarsRating = "Very Good";
                    });
                  }
                  if (countRatingStars == 5) {
                    setState(() {
                      titleStarsRating = "Excellent";
                    });
                  }
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                titleStarsRating,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    DatabaseReference rateDriverRef = FirebaseDatabase.instance
                        .ref()
                        .child("drivers")
                        .child(widget.assignedDriverId!)
                        .child("ratings");

                    rateDriverRef.once().then((snap) {
                      if (snap.snapshot.value == null) {
                        rateDriverRef.set(countRatingStars.toString());

                        SystemNavigator.pop();
                      } else {
                        double pastRatings =
                            double.parse(snap.snapshot.value.toString());
                        double newAverageRatings =
                            (pastRatings + countRatingStars) / 2;
                        rateDriverRef.set(newAverageRatings.toString());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      }

                      Fluttertoast.showToast(msg: "Please Restart App Now");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 74),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
