import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'dart:math';

import 'package:g_value_calculator/src/app_form_field.dart';

class ReynoldsNumber extends StatefulWidget {
  @override
  _ReynoldsNumberState createState() => _ReynoldsNumberState();
}

class _ReynoldsNumberState extends State<ReynoldsNumber> {
  TextEditingController _dController = TextEditingController();
  TextEditingController _nController = TextEditingController();
  double _selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _selectedValue = 1.307 * pow(10, -3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reynolds Number'),
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              AppTextFormField(
                labelText: 'D',
                helperText: 'D: Impeller diameter (m)',
                controller: _dController,
              ),
              AppTextFormField(
                labelText: 'n',
                helperText: 'n: Rotation per second (R/sec)',
                controller: _nController,
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
                      value: _selectedValue,
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
                          _selectedValue = value;
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
                    double result = (pow(double.parse(_dController.text), 2) *
                            double.parse(_nController.text) *
                            1000) /
                        _selectedValue;

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
    super.dispose();
  }
}
