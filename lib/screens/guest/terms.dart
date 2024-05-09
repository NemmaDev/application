// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, unused_field, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class termScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  
  const termScreen({
    required Key key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<termScreen> createState() => _termScreenState();
}

class _termScreenState extends State<termScreen> {
  late ScrollController _ScrollController;
  bool _termsRead = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ScrollController = ScrollController();
    _ScrollController.addListener(() {
      if (_ScrollController.offset >=
              _ScrollController.position.maxScrollExtent &&
          !_ScrollController.position.outOfRange) {
        setState(() {
          _termsRead = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text('Terms & Conditions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.onChangedStep(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _ScrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Bienvenue sur Leadee application. Veuillez lire attentivement les conditions d'utilisation suivantes avant d'accéder ou d'utiliser notre application mobile.\n\nEn accédant ou en utilisant l'application, vous acceptez d'être lié par ces conditions. Si vous n'acceptez pas toutes les conditions énoncées sur cette page, vous ne pouvez pas accéder à l'application.\n\nSous réserve de votre respect des présentes conditions, Leadee vous accorde une licence limitée, non exclusive, non transférable et révocable pour accéder et utiliser l'application à des fins personnelles et non commerciales.\n\nVous acceptez de ne pas reproduire, dupliquer, copier, vendre, revendre ou exploiter toute partie de l'application sans l'autorisation expresse écrite de Leadee.\n\nNous respectons votre vie privée et nous nous engageons à protéger vos informations personnelles. Veuillez consulter notre Politique de confidentialité pour comprendre comment nous collectons, utilisons et protégeons vos données.\n\nSi vous avez des questions concernant ces conditions d'utilisation, veuillez nous contacter à l'adresse sanfonemmata@gmail.com.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: !_termsRead
                      ? null
                      : () {
                         widget.onChangedStep(2);
                        },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(15.0),
                    backgroundColor: _termsRead ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    'Accept & continue'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
