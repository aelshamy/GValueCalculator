import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/paddle_mixer.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/propeller_mixer_laminar.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/propeller_mixer_turbulent.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/reynolds_number.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/turbine_mixer_laminar.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/turbine_mixer_turbulent.dart';

class MechanicalMixer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Mixer'),
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
              child: Text('R'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Reynolds Number'),
            onTap: () {
              navigateTo(context, ReynoldsNumber());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('P'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text(' Propeller Mixer (Laminar)'),
            onTap: () {
              navigateTo(context, PropellerMixerLaminar());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('T'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Turbine Mixer (Laminar)'),
            onTap: () {
              navigateTo(context, TurbineMixerLaminar());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('P'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Propeller Mixer (Turbulent)'),
            onTap: () {
              navigateTo(context, PropellerMixerTurbulent());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('T'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Turbine Mixer (Turbulent)'),
            onTap: () {
              navigateTo(context, TurbineMixerTurbulent());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('P'),
              backgroundColor: Colors.amberAccent.shade400,
            ),
            title: Text('Paddle Mixer'),
            onTap: () {
              navigateTo(context, PaddleMixer());
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
