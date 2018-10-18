import 'package:flutter/material.dart';
import 'package:g_value_calculator/src/about.dart';
import 'dart:math';

import 'package:g_value_calculator/src/app_form_field.dart';

class TurbineMixerLaminar extends StatefulWidget {
  @override
  _TurbineMixerLaminarState createState() => _TurbineMixerLaminarState();
}

class _TurbineMixerLaminarState extends State<TurbineMixerLaminar> {
  TextEditingController _dController = TextEditingController();
  TextEditingController _nController = TextEditingController();
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
        title: Text('Turbine Mixer (Laminar)'),
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
              RaisedButton(
                child: Text('Calculate'),
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                textColor: Colors.white,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    double result = sqrt((
                            // k *
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
