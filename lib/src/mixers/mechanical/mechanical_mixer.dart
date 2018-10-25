import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/paddle_mixer.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/propeller_mixer_laminar.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/propeller_mixer_turbulent.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/reynolds_number.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/turbine_mixer_laminar.dart';
import 'package:g_value_calculator/src/mixers/mechanical/sections/turbine_mixer_turbulent.dart';
import 'package:g_value_calculator/src/section_tile.dart';

class MechanicalMixer extends StatelessWidget {
  String _title;
  set title(String value) {
    this._title = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: MyAppBar(
        title: _title,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          SectionTile(
            title: 'Reynolds Number',
            pagetToNavigate: ReynoldsNumber(),
          ),
          SectionTile(
            title: 'Propeller Mixer (Laminar)',
            pagetToNavigate: PropellerMixerLaminar(),
          ),
          SectionTile(
            title: 'Turbine Mixer (Laminar)',
            pagetToNavigate: TurbineMixerLaminar(),
          ),
          SectionTile(
            title: 'Propeller Mixer (Turbulent)',
            pagetToNavigate: PropellerMixerTurbulent(),
          ),
          SectionTile(
            title: 'Turbine Mixer (Turbulent)',
            pagetToNavigate: TurbineMixerTurbulent(),
          ),
          SectionTile(
            title: 'Paddle Mixer',
            pagetToNavigate: PaddleMixer(),
          ),
        ],
      ),
    );
  }
}
