abstract interface class AppServicePort {
  bool isUsingLightTheme();
  void usingLightTheme(bool use);
  String get appVersion;
}
