import 'package:flutter/material.dart';

class ImageCheckBoxButton extends StatefulWidget {
  final String image;
  final String text;
  final double value;
  final double groupValue;
  final Function valueSetter;

  ImageCheckBoxButton(
      {Key key,
      this.image,
      this.text,
      this.value,
      this.groupValue,
      this.valueSetter})
      : super(key: key);
  @override
  ImageCheckBoxButtonState createState() => ImageCheckBoxButtonState();
}

class ImageCheckBoxButtonState extends State<ImageCheckBoxButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        child: SizedBox(
          width: 140.0,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    widget.image,
                    width: 140.0,
                    height: 140.0,
                  ),
                  widget.groupValue == widget.value
                      ? Container(
                          width: 30.0,
                          height: 30.0,
                          color: Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          setState(() {
            widget.valueSetter(widget.value);
          });
        },
      ),
    );
  }
}
