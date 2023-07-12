import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ports/storage_port.dart';

@Singleton(as: StoragePort)
final class SharedPreferencesStorageAdapter implements StoragePort {
  late final SharedPreferences _sharedPref;

  SharedPreferencesStorageAdapter() {
    SharedPreferences.getInstance().then((value) => _sharedPref = value);
  }

  @override
  String? get(String key) {
    return _sharedPref.getString(key);
  }

  @override
  void save(String key, String value) async {
    await _sharedPref.setString(key, value);
  }

  @override
  Future<void> removeAll() async {
    _sharedPref.clear();
  }
}
