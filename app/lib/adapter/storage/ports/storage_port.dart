abstract interface class StoragePort {
  Future<void> save(String key, String value);
  String? get(String key);
  Future<void> removeAll();
}
