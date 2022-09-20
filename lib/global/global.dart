import 'package:firebase_auth/firebase_auth.dart';
import 'package:swifttra/models/direction_details_info.dart';
import 'package:swifttra/models/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId = "";
String cloudMessagingServerToken =
    "key=AAAABIZYqWo:APA91bG4oAEza8NTXJLhmSt8p_M7jZkHE0pb4CuTHTiWh-9XZJqPIiWvNAcDHRP4UksvN4vQbEC1V5j0zLEmseezSlopjE_1eNmb5jjMRk1h-S-G_45pHKGF_6sbkTJgoa9rcL2XqaPa";
String userDropOffAddress = "";
String driverCarDetails = "";
String drivername = "";
String driversurname = "";
String driverPhone = "";
String car_number = "";
String car_color = "";
String car_model = "";
double countRatingStars = 0.0;
String titleStarsRating = "";
String allTripsHistoryInformationList = "";
