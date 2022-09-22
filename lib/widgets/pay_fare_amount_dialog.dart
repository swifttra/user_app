import 'package:flutter/material.dart';
import 'package:swifttra/Payment/payment_screen.dart';

// ignore: must_be_immutable
class PayFareAmountDialog extends StatefulWidget {
  double? fareAmount;

  PayFareAmountDialog({Key? key, this.fareAmount}) : super(key: key);

  @override
  State<PayFareAmountDialog> createState() => _PayFareAmountDialogState();
}

class _PayFareAmountDialogState extends State<PayFareAmountDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      //  backgroundColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(6),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Fare Amount".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 18,
                fontFamily: 'Oxygen',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "₦" + widget.fareAmount.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This is the total trip fare amount, Please Pay it to the driver ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    Navigator.pop(context, "cashPayed");
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Pay Cash",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Oxygen',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   "₦  ${widget.fareAmount!}",
                    //   style: const TextStyle(
                    //     fontSize: 20,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const Text(
              "OR",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 230,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const PaymentScreen()));
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 246, 246, 246)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ))),
                child: const Text(
                  "Transfer",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 18,
                    fontFamily: 'Oxygen',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
