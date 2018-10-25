import 'package:flutter/material.dart';
import 'dart:math';
import 'package:g_value_calculator/src/app_form_field.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';

class HorizontalFlowBaffles extends StatefulWidget {
  String _title;
  set title(String value) {
    this._title = value;
  }

  @override
  _HorizontalFlowBafflesState createState() => _HorizontalFlowBafflesState();
}

class _HorizontalFlowBafflesState extends State<HorizontalFlowBaffles> {
  TextEditingController _nController = TextEditingController();
  TextEditingController _qController = TextEditingController();
  TextEditingController _tController = TextEditingController();
  TextEditingController _hController = TextEditingController();
  TextEditingController _lController = TextEditingController();
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
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: widget._title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              AppTextFormField(
                labelText: 'n',
                helperText: 'n: Number of baffles in the chamber',
                controller: _nController,
              ),
              AppTextFormField(
                labelText: 'Q',
                helperText: 'Q: Water flow rate (m3/sec)',
                controller: _qController,
              ),
              AppTextFormField(
                labelText: 'T',
                helperText: "T: Time of flocculation 'residence time' (sec)",
                controller: _tController,
              ),
              AppTextFormField(
                labelText: 'H',
                helperText: "H: Depth of water in the basin (m)",
                controller: _hController,
              ),
              AppTextFormField(
                labelText: 'L',
                helperText: "L: Length of the basin (m)",
                controller: _lController,
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
                    double result = sqrt((970 *
                            pow(double.parse(_nController.text), 3) *
                            pow(double.parse(_qController.text), 2)) /
                        (_selectedValue *
                            double.parse(_tController.text) *
                            pow(double.parse(_hController.text), 2) *
                            pow(double.parse(_lController.text), 2)));

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
    _nController.dispose();
    _qController.dispose();
    _tController.dispose();
    _hController.dispose();
    _lController.dispose();
    super.dispose();
  }
}
