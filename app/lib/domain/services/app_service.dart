import 'package:injectable/injectable.dart';
import 'package:note_app/adapter/adapter.dart';

import '../ports/app_service_port.dart';

@Singleton(as: AppServicePort)
final class AppService implements AppServicePort {
  static const String themeKey = 'theme';
  final StoragePort _storagePort;
  final InfoPackagePort _infoPackagePort;

  AppService(this._storagePort, this._infoPackagePort);

  @override
  bool isUsingLightTheme() => _storagePort.get(themeKey) == 'true';

  @override
  Future<void> usingLightTheme(bool use) =>
      _storagePort.save(themeKey, use.toString());

  @override
  String get appVersion => _infoPackagePort.appVersion;
}
