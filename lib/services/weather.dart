import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';


const apikey= 'b58ef14a4f48d0c8bc3a6b6480ff0bbc';

const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper = NetworkHelper('$openWeatherUrl?q=$cityName&appid=$apikey&units=metric');
    var resultData = await networkHelper.getData();
    return resultData;
}


Future<dynamic> getLocationWeather() async{

    Location location = Location();
    await location.getCurrentLocation();

    print('its executed');

    NetworkHelper networkHelper = NetworkHelper('$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var resultData = await networkHelper.getData();

    return resultData;
}


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
