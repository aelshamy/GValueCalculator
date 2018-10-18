import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'package:g_value_calculator/src/mixers/static/sections/horizontal_flow_baffles.dart';
import 'package:g_value_calculator/src/mixers/static/sections/hydraulic_jumps.dart';
import 'package:g_value_calculator/src/mixers/static/sections/venturi_section.dart';
import 'package:g_value_calculator/src/mixers/static/sections/vertical_flow_baffles.dart';

class StaticMixer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Static Mixer'),
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
              child: Text('V'),
              backgroundColor: Colors.amberAccent.shade700,
            ),
            title: Text('Venturi sections'),
            onTap: () {
              navigateTo(context, VenturiSections());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('H'),
              backgroundColor: Colors.amberAccent.shade700,
            ),
            title: Text('Hydraulic jumps, Parshall flume, Weirs'),
            onTap: () {
              navigateTo(context, HydraulicJumps());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('H'),
              backgroundColor: Colors.amberAccent.shade700,
            ),
            title: Text('Horizontal flow baffles'),
            onTap: () {
              navigateTo(context, HorizontalFlowBaffles());
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            leading: CircleAvatar(
              child: Text('H'),
              backgroundColor: Colors.amberAccent.shade700,
            ),
            title: Text('Vertical flow baffles'),
            onTap: () {
              navigateTo(context, VerticalFlowBaffles());
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
