import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:markat_store/Shared%20preferences/shared_preferences.dart';

import '../getx/address_getx_controller.dart';
import '../models/customer_address.dart';

class CustomerAddressController {
  Future<List<CustomerAddresses>> getCustomerAddress() async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_address&customer_id=${AppSettingsPreferences().user().customerId}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here

      print(response.statusCode);
      var jsonResopnse = json.decode(jsonResponse)['customer_address'] as List;
      print(jsonResopnse);

      return jsonResopnse
          .map((jsonObject) => CustomerAddresses.fromJson(jsonObject))
          .toList();
    } else {
      // Handle errors
      print(response.statusCode);

      return [];
    }
  }

  Future<bool> deleteCustomerAddress(
      {required String customer_id, required String address_id}) async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_address|remove&customer_id=${AppSettingsPreferences().user().customerId}&address_id=${address_id}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here
      await CategoriesGetxController.to.deleteAddress(address_id);
      print(response.statusCode);
      return true;
    } else {
      // Handle errors
      print(response.statusCode);
      return false;
    }
  }
}
