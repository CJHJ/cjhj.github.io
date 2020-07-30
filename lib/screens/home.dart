import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'A food fanatic, music performer/producer, code tinkerer.',
        style: TextStyle(
          fontSize: 16.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
