import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterController {
  Future<void> registerCustomer({
    required String firstName,
    required String lastName,
    required String email,
    required String telephone,
    required String company,
    required String address_1,
    required String address_2,
    required String city,
    required String postcode,
    required String country_id,
    required String zone_id,
    required String password,
    required String confirm,
    required String newsletter,
  }) async {
    var url = Uri.parse(
        "http://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer.add&api_key=2P9m8R4AT570rE");
    var response = await http.post(url, headers: {
      'Cookie': 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD',
      'X-Oc-Merchant-Language': 'en'
    }, body: {
      'firstname': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirm': confirm,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // LoginStatus loginStatus = LoginStatus.fromJson(jsonResponse);
      // if (loginStatus.login!.first.status!) {
      //   await customerController().getCustomerDataByEmail(email);
      //   return true;
      // } else {
      //   return false;
      // }
    } else if (response.statusCode == 400) {
    } else {}
    // return false;

    // final client = HttpClient();

    // // Allow self-signed certificates (not recommended for production)
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => true;

    // final uri = Uri.parse(
    //     'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_customer.add&api_key=2P9m8R4AT570rE');

    // final request = await client.postUrl(uri);
    // request.headers
    //     .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    // request.headers.add('X-Oc-Merchant-Language', 'en');
    // // request.headers.remove(HttpHeaders.contentLengthHeader);

    // // Prepare the POST data
    // final postData = {
    //   'firstname': firstName,
    //   'lastName': lastName,
    //   'email': email,
    //   'telephone': "123456789",
    //   'company': "Q8at",
    //   'address_1': "201 شارع اسكندرية",
    //   'address_2': "",
    //   'city': "الاسكندرية",
    //   // 'postcode': "s",
    //   'country_id': "63",
    //   'zone_id': "1006",
    //   'password': password,
    //   'confirm': confirm,
    //   'newsletter': "1",
    // };

    // // Encode the POST data as JSON
    // final jsonBody = json.encode(postData);

    // // Set the content type and content length headers
    // request.headers.contentType = ContentType.json;
    // // request.headers.contentLength = jsonBody.length;

    // // Write the JSON data to the request body
    // request.write(jsonBody);

    // final response = await request.close();

    // // Handle the response as needed
    // final responseBody = await response.transform(utf8.decoder).join();
    // print(responseBody);
    // print(response.statusCode);

    // // Close the client when done
    // client.close();
    // // final client = http.Client();
    // //
    // // // Allow self-signed certificates (not recommended for production)
    // // HttpClient httpClient = HttpClient();
    // // httpClient.badCertificateCallback =
    // //     (X509Certificate cert, String host, int port) => true;
    // //
    // // final request = await httpClient.getUrl(
    // //   Uri.parse(
    // //       'https://appma.markatstore.com/index.php?route=extension/gwsocapi/module/api/gws_products&api_key=2P9m8R4AT570rE'),
    // // );
    // // request.headers
    // //     .add('Cookie', 'OCSESSID=c80c1006a6fe61ace53c62c809; currency=KWD');
    // // request.headers.add('X-Oc-Merchant-Language', 'en');
    // // final jsonBody = {
    // //   'firstname': firstName,
    // //   'lastName': lastName,
    // //   'email': email,
    // //   'telephone': telephone,
    // //   'company': company,
    // //   'address_1': address_1,
    // //   'address_2': address_2,
    // //   'city': city,
    // //   'postcode': postcode,
    // //   'country_id': country_id,
    // //   'zone_id': zone_id,
    // //   'password': password,
    // //   'confirm': confirm,
    // //   'newsletter': newsletter,
    // //   // Add any other data you want to send in the body
    // // };
  }
}
