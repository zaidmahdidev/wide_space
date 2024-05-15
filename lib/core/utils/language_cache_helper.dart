class LanguageCacheHelper {
  final key = "local";
  Future<void> cacheLanguageCode(String languageCode) async {
    // final sharedPreferences = di.sl.get<SharedPreferences>();
    // sharedPreferences.setString(key, languageCode);
  }

  Future<String?> getCachedLanguageCode() async {
    // final sharedPreferences = di.sl.get<SharedPreferences>();
    // final languageCode = sharedPreferences.getString(key);
    // if (languageCode != null) {
    //   return sharedPreferences.getString(key);
    // } else {
    //   return Platform.localeName;
    // }
    return null;
  }
}
