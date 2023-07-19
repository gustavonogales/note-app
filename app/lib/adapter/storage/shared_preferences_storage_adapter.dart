import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ports/storage_port.dart';

@Injectable(as: StoragePort)
final class SharedPreferencesStorageAdapter implements StoragePort {
  late final SharedPreferences _sharedPref;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  @override
  String? get(String key) {
    return _sharedPref.getString(key);
  }

  @override
  Future<void> save(String key, String value) async {
    await _sharedPref.setString(key, value);
  }

  @override
  Future<void> removeAll() async {
    _sharedPref.clear();
  }
}
