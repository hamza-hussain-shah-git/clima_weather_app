import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/services.dart';

import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:  Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding:  EdgeInsets.all(20.0),
                    child:  TextField(
                      onChanged: (value){
                        cityName = value;
                      },
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration:kTextFieldInputDecoration,
                    ),
                  ), // Close the Container for TextField
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                      print(cityName);
                    },
                    child:  Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ), // Close the TextButton
                ],
              ), // Close the Column
            ],
          ),
        ),
      ),
    );
  }
}
