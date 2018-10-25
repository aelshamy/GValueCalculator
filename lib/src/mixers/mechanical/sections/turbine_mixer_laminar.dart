import 'package:flutter/material.dart';
import 'dart:math';
import 'package:g_value_calculator/src/app_form_field.dart';
import 'package:g_value_calculator/src/checkbox_button.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';

class TurbineMixerLaminar extends StatefulWidget {
  String _title;

  set title(String value) {
    this._title = value;
  }

  @override
  _TurbineMixerLaminarState createState() => _TurbineMixerLaminarState();
}

class _TurbineMixerLaminarState extends State<TurbineMixerLaminar> {
  TextEditingController _dController = TextEditingController();
  TextEditingController _nController = TextEditingController();
  TextEditingController _vController = TextEditingController();

  double groupValue;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    groupValue = 0.0;
    super.initState();
  }

  void setGropValue(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: widget._title,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              AppTextFormField(
                labelText: 'n',
                helperText: 'n: Rotation per second (R/sec)',
                controller: _nController,
              ),
              AppTextFormField(
                labelText: 'D',
                helperText: 'D: Impeller diameter (m)',
                controller: _dController,
              ),
              AppTextFormField(
                labelText: 'V',
                helperText: 'V: Volume of mixing chamber (m3)',
                controller: _vController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageCheckBoxButton(
                    image: 'images/13.jpg',
                    text: 'Turbine 4 flat blade, Vaned disk',
                    value: 71.00000000001,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                  ImageCheckBoxButton(
                    image: 'images/14.jpg',
                    text: 'Turbine 6 flat blade, Vaned disk',
                    value: 71.0,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageCheckBoxButton(
                    image: 'images/15.jpg',
                    text: 'Turbine, 6 curved blade',
                    value: 70.00000000001,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                  ImageCheckBoxButton(
                    image: 'images/16.jpg',
                    text: 'Fan turbine, 6 blades at 45 degree',
                    value: 70.0,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageCheckBoxButton(
                    image: 'images/17.jpg',
                    text: 'Shrouded turbine, 6 curved blade',
                    value: 97.5,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                  ImageCheckBoxButton(
                    image: 'images/18.jpg',
                    text: 'Shrouded turbine, with stator, no baffles',
                    value: 172.5,
                    groupValue: groupValue,
                    valueSetter: setGropValue,
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Calculate'),
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                textColor: Colors.white,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    double result = sqrt((groupValue *
                            pow(double.parse(_nController.text), 2) *
                            pow(double.parse(_dController.text), 3)) /
                        (double.parse(_vController.text)));

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Result'),
                          content: RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'The velocity gradient by: '),
                                  TextSpan(
                                    text: '$result (sec-1)',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _dController.dispose();
    _nController.dispose();
    _vController.dispose();
    super.dispose();
  }
}
