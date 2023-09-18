import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Shared preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final String storageKey = 'selectedLanguage';

  Future<void> changeLanguage(Locale newLocale) async {
    Get.updateLocale(newLocale);
    await AppSettingsPreferences().saveLanguage(
      language: newLocale.languageCode,
    );
  }

  Future<void> loadSavedLanguage() async {
    String? selectedLanguage = AppSettingsPreferences().langCode;
    if (selectedLanguage != null) {
      Locale savedLocale = Locale(selectedLanguage);
      Get.updateLocale(savedLocale);
    }
  }
}
