import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../Shared preferences/shared_preferences.dart';
import '../getx/address_getx_controller.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

import '../models/wishlist_product.dart';
import '../utils/helpers.dart';

class ApiWishListProductController with Helpers {
  Future<List<CustomerWishlist>> getWishListProductByCustomerId(
      String customer_id) async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_wishlist&customer_id=${AppSettingsPreferences().user().customerId}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here

      print(response.statusCode);
      var jsonResopnse = json.decode(jsonResponse)['customer_wishlist'] as List;
      print(jsonResopnse);

      return jsonResopnse
          .map((jsonObject) => CustomerWishlist.fromJson(jsonObject))
          .toList();
    } else {
      // Handle errors
      print(response.statusCode);

      return [];
    }
  }

  Future<bool> deletetProductFromWishList(
      BuildContext context, String customer_id, String product_id) async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_wishlist|remove&customer_id=${AppSettingsPreferences().user().customerId}&product_id=${product_id}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here
      await CategoriesGetxController.to.deleteWishProduct(product_id);
      Helpers.showSnackBar(context: context, message: "Deleted Succefully");
      return true;
    } else {
      // Handle errors
      print(response.statusCode);
      Helpers.showSnackBar(context: context, message: "Deleted Failed");

      return false;
    }
  }

  Future<bool> addProductFromWishList(
      BuildContext context, String customer_id, String product_id) async {
    final client = http.Client();

    // Allow self-signed certificates (not recommended for production)
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final request = await httpClient.getUrl(
      Uri.parse(
          'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer_wishlist|add&customer_id=${AppSettingsPreferences().user().customerId}&product_id=${product_id}&api_key=2P9m8R4AT570rE'),
    );
    request.headers
        .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    request.headers.add('X-Oc-Merchant-Language', 'en');

    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonResponse = await response.transform(utf8.decoder).join();
      // Handle the list of categories here
      await CategoriesGetxController.to.addtoWishProduct(product_id);
      Helpers.showSnackBar(context: context, message: "Added Succefully");
      return true;
    } else {
      // Handle errors
      print(response.statusCode);

      Helpers.showSnackBar(
          context: context, message: "Added Failed", error: true);

      return false;
    }
  }
}
