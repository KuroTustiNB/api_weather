import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 227, 240),
      appBar: AppBar(
        title: const Text('Booking',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 000))),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}
