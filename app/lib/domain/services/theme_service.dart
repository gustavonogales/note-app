import 'package:injectable/injectable.dart';
import 'package:note_app/adapter/adapter.dart';

import '../ports/theme_service_port.dart';

@Singleton(as: ThemeServicePort)
final class ThemeService implements ThemeServicePort {
  static const String themeKey = 'theme';
  final StoragePort _storagePort;

  ThemeService(this._storagePort);

  @override
  bool isUsingLightTheme() => _storagePort.get(themeKey) == 'true';

  @override
  Future<void> usingLightTheme(bool use) =>
      _storagePort.save(themeKey, use.toString());
}
