import 'package:http/http.dart' as http;
import 'dart:convert';


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {


  Future<Map<String,String> > requestCoinsPrice({String selectedCurrency}) async {
      Map<String,String> responseMap;

    for (String crypto in cryptoList) {

      String fetchedPrice;
      String url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$selectedCurrency';
      try {
        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          fetchedPrice = data['last'].toString();
        } else {
          print(response.statusCode);
          fetchedPrice = response.statusCode.toString();
        }
      } catch (e) {
        print(e);
        fetchedPrice = ' Error';
//        throw '$e';
      }
      responseMap['$crypto'] = fetchedPrice;

    }

    return responseMap;
  }

// TODO: WE MUST MAKE THIS SHIT WORK SENDING LIKE GRAPH QL NOT A MAP MAN MAYBE

//  Map<String,Future<String>> _response;
//
//  void populateList(String selectedCurrency) {
//
//    for(String crypto in cryptoList){
//     _response['$crypto'] = requestCoinsPrice(selectedCurrency: selectedCurrency,crypto: crypto);
//    }
//  }
//
//
//  void sendData(selectedCurrency) async {
//    populateList(selectedCurrency);
//
//    var tem = _response.values;
//    for (String t in tem){
//      await t;
//    }
//
//
//  }


}
