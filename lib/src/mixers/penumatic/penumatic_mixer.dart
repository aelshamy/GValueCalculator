import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'dart:math';

import 'package:g_value_calculator/src/app_form_field.dart';

class PenumaticMixer extends StatefulWidget {
  @override
  _PenumaticMixerState createState() => _PenumaticMixerState();
}

class _PenumaticMixerState extends State<PenumaticMixer> {
  TextEditingController _qaController = TextEditingController();
  TextEditingController _hController = TextEditingController();
  TextEditingController _vController = TextEditingController();
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
        title: Text('Venturi Sections'),
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
                labelText: 'Qa',
                helperText:
                    'Qa: Air flow rate at operating temperature and pressure (m3/sec)',
                controller: _qaController,
              ),
              AppTextFormField(
                labelText: 'h',
                helperText: 'h: depth to the diffusers in meters of water (m)',
                controller: _hController,
              ),
              AppTextFormField(
                labelText: 'V',
                helperText: 'V: Volume of mixing chamber (m3)',
                controller: _vController,
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
                    double result = sqrt((1.689 *
                            double.parse(_qaController.text) *
                            log((double.parse(_hController.text) + 10.33) /
                                (10.33))) /
                        (_selectedValue * double.parse(_vController.text)));

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
    _qaController.dispose();
    _hController.dispose();
    _vController.dispose();
    super.dispose();
  }
}
