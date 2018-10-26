import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0.0,
        title: Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text(
              'Many of water experts suffer from the difficulty in G-Value calculation this about to end through the use of this innovative application it will allow you to calculate your mixing velocity gradient through digital smart interface.',
              style: getTextStyle(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Text(
              'G Value: measure of the relative velocity of two particles of fluid and distance between "The parameter that express mixing intensity by sec-1',
              style: getTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(fontSize: 22.0);
  }
}

class AboutPageRoute extends MaterialPageRoute {
  AboutPageRoute() : super(builder: (BuildContext context) => new About());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  // @override
  // Widget buildPage(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation) {
  //   return new FadeTransition(opacity: animation, child: new About());
  // }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: About(),
      ),
    );
  }
}
