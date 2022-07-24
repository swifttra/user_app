import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: PayMent()),
    );
  }
}

class PayMent extends StatefulWidget {
  @override
  State<PayMent> createState() => _PayMentState();
}

class _PayMentState extends State<PayMent> {
  TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    _paystack = super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 5,
                        color: Color.fromARGB(255, 255, 136, 0),
                      ))),
            ),
            RaisedButton(onPressed: null, child: Text("Pay Now"))
          ],
        ),
      ),
    );
  }
}
