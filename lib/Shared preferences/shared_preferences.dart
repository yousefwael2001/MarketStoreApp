import 'package:markat_store/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsPreferences {
  AppSettingsPreferences._internal();

  late SharedPreferences _sharedPreferences;

  static final AppSettingsPreferences _instance =
      AppSettingsPreferences._internal();

  factory AppSettingsPreferences() {
    return _instance;
  }

  Future<void> intiPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveLanguage({required String language}) async {
    await _sharedPreferences.setString('lang_code', language);
  }

  String get langCode => _sharedPreferences.getString('lang_code') ?? "ar";

  Future<void> saveCustomer({required Customer user}) async {
    _sharedPreferences.setString('customerId', user.customerId ?? "");
    _sharedPreferences.setString('customerGroupId', user.customerGroupId ?? "");
    _sharedPreferences.setString('storeId', user.storeId ?? "");
    _sharedPreferences.setString('languageId', user.languageId ?? "");
    _sharedPreferences.setString('firstname', user.firstname ?? "");
    _sharedPreferences.setString('lastname', user.lastname ?? "");
    _sharedPreferences.setString('email', user.email ?? "");
    _sharedPreferences.setString('telephone', user.telephone ?? "");
    _sharedPreferences.setString('newsletter', user.newsletter ?? "");
    _sharedPreferences.setString('customField', user.customField ?? "");
    _sharedPreferences.setString('ip', user.ip ?? "");
    _sharedPreferences.setString('status', user.status ?? "");
    _sharedPreferences.setString('safe', user.safe ?? "");
    _sharedPreferences.setString('token', user.token ?? "");
    _sharedPreferences.setString('code', user.code ?? "");
    _sharedPreferences.setString('dateAdded', user.dateAdded ?? "");
  }

  Customer user() {
    Customer user = new Customer();
    user.customerId = _sharedPreferences.getString('customerId')!;
    user.customerGroupId = _sharedPreferences.getString('customerGroupId')!;
    user.storeId = _sharedPreferences.getString('storeId')!;
    user.languageId = _sharedPreferences.getString('languageId');
    user.firstname = _sharedPreferences.getString('firstname')!;
    user.lastname = _sharedPreferences.getString('lastname')!;
    user.email = _sharedPreferences.getString('email')!;
    user.telephone = _sharedPreferences.getString('telephone')!;
    user.newsletter = _sharedPreferences.getString('newsletter')!;
    user.customField = _sharedPreferences.getString('customField')!;
    user.ip = _sharedPreferences.getString('ip')!;
    user.status = _sharedPreferences.getString('status')!;
    user.safe = _sharedPreferences.getString('safe')!;
    user.token = _sharedPreferences.getString('token')!;
    user.code = _sharedPreferences.getString('code')!;
    user.dateAdded = _sharedPreferences.getString('dateAdded')!;
    return user;
  }

  Future<void> updateLoggedIn() async {
    print(_sharedPreferences.getString('token'));
    await _sharedPreferences.setString('token', '');
    print(_sharedPreferences.getString('token'));
  }

  String get token => _sharedPreferences.getString('token') ?? '';

  void handleClearPrefs() {
    _sharedPreferences.clear();
    print("true");
  }
}
