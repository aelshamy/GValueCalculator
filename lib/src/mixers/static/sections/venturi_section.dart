import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'dart:math';

import 'package:g_value_calculator/src/app_form_field.dart';

class VenturiSections extends StatefulWidget {
  @override
  _VenturiSectionsState createState() => _VenturiSectionsState();
}

class _VenturiSectionsState extends State<VenturiSections> {
  TextEditingController _a1Controller = TextEditingController();
  TextEditingController _a2Controller = TextEditingController();
  TextEditingController _v1Controller = TextEditingController();
  TextEditingController _qController = TextEditingController();
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
                labelText: 'A1',
                helperText:
                    'A1: Cross section area of pipe 1 before mixing (m2)',
                controller: _a1Controller,
              ),
              AppTextFormField(
                labelText: 'A2',
                helperText: 'A2: Cross section area of pipe 2 at mixing (m2)',
                controller: _a2Controller,
              ),
              AppTextFormField(
                labelText: 'v1',
                helperText:
                    'ѵ1: Water velocity in pipe 1 before mixing (m/sec)',
                controller: _v1Controller,
              ),
              AppTextFormField(
                labelText: 'Q',
                helperText: 'Q: Water flow rate (m3/sec)',
                controller: _qController,
              ),
              AppTextFormField(
                labelText: 'V',
                helperText: 'V: Volume of mixing pipe (m3)',
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
                    double result = sqrt((745.56 *
                            pow(double.parse(_a1Controller.text), 2) *
                            pow(double.parse(_v1Controller.text), 2) *
                            double.parse(_qController.text)) /
                        (pow(double.parse(_a2Controller.text), 2) *
                            _selectedValue *
                            double.parse(_vController.text)));

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
    _a1Controller.dispose();
    _a2Controller.dispose();
    _v1Controller.dispose();
    _qController.dispose();
    _vController.dispose();
    super.dispose();
  }
}
