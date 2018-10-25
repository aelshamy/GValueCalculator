import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/home_tile.dart';
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
            HomeTile(
              title: 'Static Mixers',
              subtitle: 'The mixing is done by loss in head',
              pagetToNavigate: StaticMixer(),
            ),
            HomeTile(
              title: 'Mechanical Mixers',
              subtitle: 'The mixing is done by power dissipated from motor',
              pagetToNavigate: MechanicalMixer(),
            ),
            HomeTile(
              title: 'Penumatic Mixer',
              subtitle: 'The mixing is done by gas bubbles',
              pagetToNavigate: PenumaticMixer(),
            ),
          ],
        ),
      ),
    );
  }
}
