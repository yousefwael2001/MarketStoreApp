import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:markat_store/Shared%20preferences/shared_preferences.dart';
import 'package:markat_store/models/Category.dart';
import 'package:markat_store/models/customer.dart';
import 'package:markat_store/models/product.dart';

class customerController {
  Future<List<Customer>> getCustomerData(String customer_id) async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer&customer_id=${customer_id}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here

      print(response.statusCode);
      var jsonResopnse = json.decode(jsonResponse)['customer'] as List;
      print(jsonResopnse);

      return jsonResopnse
          .map((jsonObject) => Customer.fromJson(jsonObject))
          .toList();
    } else {
      // Handle errors
      print(response.statusCode);

      return [];
    }
  }

  Future<List<Customer>> getCustomerDataByEmail(String customer_email) async {
    var url = Uri.parse(
        "http://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer&email=${customer_email}&api_key=2P9m8R4AT570rE");
    var response = await http.get(url, headers: {
      'Cookie': 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD',
      'X-Oc-Merchant-Language': 'en'
    });
    if (response.statusCode == 200) {
      // var jsonResponse = jsonDecode(response.body);
      var jsonResopnse = jsonDecode(response.body)['customer'] as List;

      await AppSettingsPreferences()
          .saveCustomer(user: Customer.fromJson(jsonResopnse.first));
      print(AppSettingsPreferences().user().customerId);
    } else if (response.statusCode == 400) {
    } else {}
    return [];
  }
}
