import 'package:flutter/material.dart';
import 'package:swifttra/assistants/request_assistant.dart';
import 'package:swifttra/global/map_key.dart';
import 'package:swifttra/models/predicted_places.dart';
import 'package:swifttra/widgets/place_prediction_tile.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPlacesScreenState createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  List<PredictedPlaces> placesPredictedList = [];

  void findPlaceAutoCompleteSearch(String inputText) async {
    if (inputText.length > 1) //2 or more than 2 input characters
    {
      String urlAutoCompleteSearch =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:NG";

      var responseAutoCompleteSearch =
          await RequestAssistant.receiveRequest(urlAutoCompleteSearch);

      if (responseAutoCompleteSearch ==
          "Error Occurred, Failed. No Response.") {
        return;
      }

      if (responseAutoCompleteSearch["status"] == "OK") {
        var placePredictions = responseAutoCompleteSearch["predictions"];

        var placePredictionsList = (placePredictions as List)
            .map((jsonData) => PredictedPlaces.fromJson(jsonData))
            .toList();

        setState(() {
          placesPredictedList = placePredictionsList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //search place ui
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 25.0),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Search Destination",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            onChanged: (valueTyped) {
                              findPlaceAutoCompleteSearch(valueTyped);
                            },
                            decoration: InputDecoration(
                              hintText: "Search Here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                left: 11.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //display place predictions result
          (placesPredictedList.isNotEmpty)
              ? Expanded(
                  child: ListView.separated(
                    itemCount: placesPredictedList.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PlacePredictionTileDesign(
                        predictedPlaces: placesPredictedList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0.5,
                        color: Color.fromARGB(255, 244, 244, 244),
                        thickness: 1,
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
