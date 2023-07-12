abstract interface class StoragePort {
  void save(String key, String value);
  String? get(String key);
  Future<void> removeAll();
}
