import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';
import 'package:g_value_calculator/src/section_tile.dart';
import 'package:g_value_calculator/src/mixers/static/sections/horizontal_flow_baffles.dart';
import 'package:g_value_calculator/src/mixers/static/sections/hydraulic_jumps.dart';
import 'package:g_value_calculator/src/mixers/static/sections/venturi_section.dart';
import 'package:g_value_calculator/src/mixers/static/sections/vertical_flow_baffles.dart';

class StaticMixer extends StatelessWidget {
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
            title: 'Venturi sections',
            pagetToNavigate: VenturiSections(),
          ),
          SectionTile(
            title: 'Hydraulic jumps, Parshall flume, Weirs',
            pagetToNavigate: HydraulicJumps(),
          ),
          SectionTile(
            title: 'Horizontal flow baffles',
            pagetToNavigate: HorizontalFlowBaffles(),
          ),
          SectionTile(
            title: 'Vertical flow baffles',
            pagetToNavigate: VerticalFlowBaffles(),
          ),
        ],
      ),
    );
  }
}
