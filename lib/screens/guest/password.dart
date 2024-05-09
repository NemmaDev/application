// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';

class passwordScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;

  const passwordScreen({
    required Key key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<passwordScreen> createState() => _passwordScreenState();
}

class _passwordScreenState extends State<passwordScreen> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _password = "";
  // ignore: unused_field
  bool _isScreet = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                 widget.onChangedStep(0, "valeur_non_null");

                },
              ),
            ),
            body: Center(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Text(
                    'Password'.toUpperCase(),
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Enter your password:'),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            onChanged: (value) =>
                                setState(() => _password = value),
                            validator: (value) => value!.length < 6
                                ? 'please entrer un password de 6 caractère'
                                : null,
                            obscureText: _isScreet,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      setState(() => _isScreet = !_isScreet),
                                  child: Icon(!_isScreet
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: 'Ex: g!Df2@gh&n',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.onChangedStep(1, _password); 

                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 24,
                              ),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            child: Text(
                              'Continuer'.toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ))));
  }
}
