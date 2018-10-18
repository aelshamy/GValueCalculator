import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'package:g_value_calculator/src/mixers/mechanical/mechanical_mixer.dart';
import 'package:g_value_calculator/src/mixers/penumatic/penumatic_mixer.dart';
import 'package:g_value_calculator/src/mixers/static/static_mixer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mixers'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              navigateTo(context, About());
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('S'),
              backgroundColor: Colors.amberAccent.shade700,
            ),
            title: Text('Static'),
            subtitle: Text('The mixing is done by loss in head'),
            onTap: () {
              navigateTo(context, StaticMixer());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('M'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Mechanical'),
            subtitle: Text('The mixing is done by power dissipated from motor'),
            onTap: () {
              navigateTo(context, MechanicalMixer());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('P'),
              backgroundColor: Colors.amberAccent.shade200,
            ),
            title: Text('Penumatic'),
            subtitle: Text('The mixing is done by gas bubbles'),
            onTap: () {
              navigateTo(context, PenumaticMixer());
            },
          ),
        ],
      ),
    );
  }

  void navigateTo(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
