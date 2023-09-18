import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/country.dart';

class ApiCountryController {
  Future<List<Country>> getCountries() async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_country&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here

      print(response.statusCode);
      var jsonResopnse = json.decode(jsonResponse)['country'] as List;
      print(jsonResopnse);

      return jsonResopnse
          .map((jsonObject) => Country.fromJson(jsonObject))
          .toList();
    } else {
      // Handle errors
      print(response.statusCode);

      return [];
    }
  }
}
