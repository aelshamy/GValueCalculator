import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget pagetToNavigate;

  HomeTile(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.pagetToNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      color: Colors.white.withOpacity(0.2),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        title: generateTitle(title),
        subtitle: generateSubtitle(subtitle),
        onTap: () {
          navigateTo(context, pagetToNavigate);
        },
      ),
    );
  }

  Widget generateTitle(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.amber, fontSize: 30.0),
    );
  }

  Widget generateSubtitle(String text) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white70, fontSize: 20.0),
      ),
    );
  }

  void navigateTo(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        page.title = title;
        return page;
      }),
    );
  }
}
