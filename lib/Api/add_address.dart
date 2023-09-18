import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:markat_store/Shared%20preferences/shared_preferences.dart';

class AddAddressController {
  Future<bool> addaddress({
    required String firstname,
    required String lastname,
    required String company,
    required String address_1,
    required String address_2,
    required String city,
    required String postcode,
    required String country_id,
    required String zone_id,
    required String customer_id,
    required BuildContext context,
  }) async {
    var url = Uri.parse(
        "http://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_address|add&customer_id=${AppSettingsPreferences().user().customerId}&api_key=2P9m8R4AT570rE");
    var response = await http.post(url, headers: {
      'Cookie': 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD',
      'X-Oc-Merchant-Language': 'en'
    }, body: {
      'firstname': firstname,
      'lastname': lastname,
      'company': company,
      'address_1': address_1,
      'address_2': address_2,
      'city': city,
      'postcode': postcode,
      'country_id': country_id,
      'zone_id': zone_id,
      'default': "0",
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // LoginStatus loginStatus = LoginStatus.fromJson(jsonResponse);
      // if (loginStatus.login!.first.status!) {
      // await customerController().getCustomerDataByEmail(email);
      // return true;
      // } else {
      // }
      print(jsonResponse);
      return true;
    } else if (response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return false;

      print(jsonResponse);
    } else {
      var jsonResponse = jsonDecode(response.body);
      return false;

      print(jsonResponse);
    }
  }

  Future<bool> editaddress({
    required String firstname,
    required String lastname,
    required String company,
    required String address_1,
    required String address_2,
    required String city,
    required String postcode,
    required String country_id,
    required String zone_id,
    required String customer_id,
    required String address_id,
    required BuildContext context,
  }) async {
    var url = Uri.parse(
        "http://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_address|edit&customer_id=${AppSettingsPreferences().user().customerId}&address_id=${address_id}&api_key=2P9m8R4AT570rE");
    var response = await http.post(url, headers: {
      'Cookie': 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD',
      'X-Oc-Merchant-Language': 'en'
    }, body: {
      'firstname': firstname,
      'lastname': lastname,
      'company': company,
      'address_1': address_1,
      'address_2': address_2,
      'city': city,
      'postcode': postcode,
      'country_id': country_id,
      'zone_id': zone_id,
      'default': "0",
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return true;
    } else if (response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return false;

      print(jsonResponse);
    } else {
      var jsonResponse = jsonDecode(response.body);
      return false;

      print(jsonResponse);
    }
  }
}
