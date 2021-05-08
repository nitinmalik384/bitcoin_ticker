import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as Http;
const String ApiKey="B9B3771E-197B-437C-A66C-BA3A7FF08F26";
const String ApiKey2="30076EA3-3FB1-49EB-854B-003E3D060F9A";


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

  Future<String> getCoinData({String cryptoName, String currencyName}) async
  {
    String url="https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currencyName?apikey=$ApiKey2";
    var response = await Http.get(url);
    if(response.statusCode==200)
      {
        var data=jsonDecode((response.body).toString());

        print(data["rate"]);
        return (data["rate"]).toStringAsFixed(2);

        
      }
  


  }


}
