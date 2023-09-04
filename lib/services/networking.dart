import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';



class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
    // Make the API request using the Uri object

    Uri apiUri = await Uri.parse(url);

    http.Response result = await http.get(apiUri);
    if(result.statusCode== 200){
      String data = result.body;

      return jsonDecode(data);

    }
    else{
      print(result.statusCode);
    }
  }

}
