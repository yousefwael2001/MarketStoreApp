import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:markat_store/Api/customer.dart';

import '../models/login.dart';

class LoginController {
  Future<bool> loginCustomer({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(
        "http://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer|login&api_key=2P9m8R4AT570rE");
    var response = await http.post(url, headers: {
      'Cookie': 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD',
      'X-Oc-Merchant-Language': 'en'
    }, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      LoginStatus loginStatus = LoginStatus.fromJson(jsonResponse);
      if (loginStatus.login!.first.status!) {
        await customerController().getCustomerDataByEmail(email);
        return true;
      } else {
        return false;
      }
    } else if (response.statusCode == 400) {
    } else {}
    return false;
  }
}
