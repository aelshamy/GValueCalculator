import 'package:flutter/material.dart';
import 'dart:math';
import 'package:g_value_calculator/src/app_form_field.dart';
import 'package:g_value_calculator/src/my_app_bar.dart';

class HydraulicJumps extends StatefulWidget {
  String _title;
  set title(String value) {
    this._title = value;
  }

  @override
  _HydraulicJumpsState createState() => _HydraulicJumpsState();
}

class _HydraulicJumpsState extends State<HydraulicJumps> {
  TextEditingController _deltaHController = TextEditingController();
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
                labelText: '∆H',
                helperText: '∆H: Head loss (m)',
                controller: _deltaHController,
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
                    double result = sqrt((9810 *
                            double.parse(_deltaHController.text) *
                            double.parse(_qController.text)) /
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
    _deltaHController.dispose();
    _qController.dispose();
    _vController.dispose();
    super.dispose();
  }
}
