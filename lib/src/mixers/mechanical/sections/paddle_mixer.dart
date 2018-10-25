import 'package:flutter/material.dart';
import 'dart:math';
import 'package:g_value_calculator/src/app_form_field.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';

class PaddleMixer extends StatefulWidget {
  String _title;

  set title(String value) {
    this._title = value;
  }

  @override
  _PaddleMixerState createState() => _PaddleMixerState();
}

class _PaddleMixerState extends State<PaddleMixer> {
  TextEditingController _rController = TextEditingController();
  TextEditingController _aController = TextEditingController();
  TextEditingController _vController = TextEditingController();
  TextEditingController _nController = TextEditingController();
  double _dragSelectedValue;
  double _tempSelectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _dragSelectedValue = 1.2;
    _tempSelectedValue = 1.307 * pow(10, -3);
    super.initState();
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
                labelText: 'A',
                helperText: 'A: Cross sectional area of paddle (m2)',
                controller: _aController,
              ),
              AppTextFormField(
                labelText: 'r',
                helperText: 'r: Distance from shaft topaddle center(m)',
                controller: _rController,
              ),
              AppTextFormField(
                labelText: 'V',
                helperText: 'V: Volume of mixing chamber (m3)',
                controller: _vController,
              ),
              AppTextFormField(
                labelText: 'N',
                helperText: 'N: Rotation per second (R/sec)',
                controller: _nController,
              ),
              Container(
                padding: EdgeInsets.only(top: 12.0, bottom: 10.0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    helperText: 'Drag Coefficient\nL/W ratio',
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<double>(
                      isExpanded: true,
                      value: _dragSelectedValue,
                      items: [
                        DropdownMenuItem(
                          child: Text('5'),
                          value: 1.2,
                        ),
                        DropdownMenuItem(
                          child: Text('20'),
                          value: 1.5,
                        ),
                        DropdownMenuItem(
                          child: Text('30'),
                          value: 1.9,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _dragSelectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 12.0, bottom: 30.0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    helperText:
                        'Temperature sensitive\nDynamic viscosity (Kg/m.sec)',
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<double>(
                      isExpanded: true,
                      value: _tempSelectedValue,
                      items: [
                        DropdownMenuItem(
                          child: Text('10'),
                          value: 1.307 * pow(10, -3),
                        ),
                        DropdownMenuItem(
                          child: Text('20'),
                          value: 1.002 * pow(10, -3),
                        ),
                        DropdownMenuItem(
                          child: Text('30'),
                          value: 0.798 * pow(10, -3),
                        ),
                        DropdownMenuItem(
                          child: Text('40'),
                          value: 0.653 * pow(10, -3),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _tempSelectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
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
                    double result = sqrt((38927.24 *
                            _dragSelectedValue *
                            double.parse(_aController.text) *
                            pow(double.parse(_rController.text), 3) *
                            pow(double.parse(_nController.text), 3)) /
                        (_tempSelectedValue * double.parse(_vController.text)));

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
    _rController.dispose();
    _aController.dispose();
    _vController.dispose();
    _nController.dispose();
    super.dispose();
  }
}
