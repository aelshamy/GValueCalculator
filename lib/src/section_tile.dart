import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final Widget pagetToNavigate;

  SectionTile({Key key, @required this.title, @required this.pagetToNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      leading: CircleAvatar(
        child: Text(
          title.substring(0, 1),
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
      title: Container(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.lightBlue.shade900,
            fontSize: 22.0,
          ),
        ),
      ),
      onTap: () {
        navigateTo(context, pagetToNavigate);
      },
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
