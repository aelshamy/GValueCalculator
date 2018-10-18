import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text(
                'Many of water experts suffer from the difficulty in G-Value calculation this about to end through the use of this innovative application it will allow you to calculate your mixing velocity gradient through digital smart interface.'),
            Text(
                'G Value: measure of the relative velocity of two particles of fluid and distance between "The parameter that express mixing intensity by sec-1'),
          ],
        ),
      ),
    );
  }
}
