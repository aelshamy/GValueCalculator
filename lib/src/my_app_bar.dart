import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade800,
      elevation: 0.0,
      title: Text(title),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
        )
      ],
    );
  }

  // TODO: implement preferredSize
  @override
  Size get preferredSize => AppBar().preferredSize;
}
