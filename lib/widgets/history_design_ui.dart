// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swifttra/models/trips_history_model.dart';

class HistoryDesignUIWidget extends StatefulWidget {
  TripsHistoryModel? tripsHistoryModel;

  HistoryDesignUIWidget({Key? key, this.tripsHistoryModel}) : super(key: key);

  @override
  State<HistoryDesignUIWidget> createState() => _HistoryDesignUIWidgetState();
}

class _HistoryDesignUIWidgetState extends State<HistoryDesignUIWidget> {
  String formatDateAndTime(String dateTimeFromDB) {
    DateTime dateTime = DateTime.parse(dateTimeFromDB);

    // Dec 10                            //2022                         //1:12 pm
    String formattedDatetime =
        "${DateFormat.MMMd().format(dateTime)}, ${DateFormat.y().format(dateTime)} - ${DateFormat.jm().format(dateTime)}";

    return formattedDatetime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //driver name + Fare Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "Driver : ${widget.tripsHistoryModel!.driverName!}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "₦ ${widget.tripsHistoryModel!.fareAmount!}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 2,
            ),

            // car details
            Row(
              children: [
                const Icon(
                  Icons.car_repair,
                  color: Colors.orangeAccent,
                  size: 28,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  widget.tripsHistoryModel!.car_details!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Oxygen',
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //icon + pickup
            Row(
              children: [
                Image.asset(
                  "images/origin.png",
                  height: 26,
                  width: 26,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    widget.tripsHistoryModel!.originAddress!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 14,
            ),

            //icon + dropOff
            Row(
              children: [
                Image.asset(
                  "images/destination.png",
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    widget.tripsHistoryModel!.destinationAddress!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 14,
            ),

            //trip time and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(""),
                Text(
                  formatDateAndTime(widget.tripsHistoryModel!.time!),
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
