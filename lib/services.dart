import 'dart:convert' ;
import 'package:http/http.dart' as http;


class ServiceHelper {

  String crypto ='BTC';
  final String fiat ;
  String fetchedPrice;

  ServiceHelper({this.fiat});

  Future<String> getSimpleRequest() async {

    //TODO : WE MUST FIRST MAKE THE SIMPLEST THING THEN CHANGE IT TO THE OTHER THINGS

    String url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$fiat';

    http.Response apiResponse = await http.get(url);
    if (apiResponse.statusCode == 200 ) {
      var priceData = jsonDecode(apiResponse.body);
      fetchedPrice = priceData['last'].toString();
    }else{
      print(apiResponse.statusCode);
    }

    return fetchedPrice;
  }

}