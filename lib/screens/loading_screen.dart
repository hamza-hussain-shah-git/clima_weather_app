import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';




class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();


}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
   initState() {
    getLocationData();
  }
  void getLocationData() async{

    var  resultData = await WeatherModel().getLocationWeather();
     Navigator.push(context, MaterialPageRoute(builder: (context){
       return LocationScreen(locationWeather: resultData,);
     }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.green,
          waveColor: Colors.lightGreen,
          trackColor: Colors.lightGreen,
          size: 150.0,
        ),
      ),
    );
  }
}
