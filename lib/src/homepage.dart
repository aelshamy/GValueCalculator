import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/mixers/mechanical/mechanical_mixer.dart';
import 'package:g_value_calculator/src/mixers/penumatic/penumatic_mixer.dart';
import 'package:g_value_calculator/src/mixers/static/static_mixer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              color: Colors.white.withOpacity(0.2),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                title: title('Static'),
                subtitle: subtitle('The mixing is done by loss in head'),
                onTap: () {
                  navigateTo(context, StaticMixer());
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              color: Colors.white.withOpacity(0.2),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                title: title('Mechanical'),
                subtitle: subtitle(
                    'The mixing is done by power dissipated from motor'),
                onTap: () {
                  navigateTo(context, MechanicalMixer());
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              color: Colors.white.withOpacity(0.2),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                title: title('Penumatic'),
                subtitle: subtitle('The mixing is done by gas bubbles'),
                onTap: () {
                  navigateTo(context, PenumaticMixer());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget title(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.green, fontSize: 30.0),
    );
  }

  Widget subtitle(String text) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white70, fontSize: 20.0),
      ),
    );
  }
}
