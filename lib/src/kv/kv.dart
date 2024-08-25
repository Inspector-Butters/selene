import 'dart:convert';
import 'dart:io';

class KeyValueStore {
  final String _filePath = "kvstore.json";
  Map<String, dynamic> _store = {};

  KeyValueStore() {
    _load();
  }

  // Load data from the file if it exists
  void _load() {
    final file = File(_filePath);
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      _store = jsonDecode(contents) as Map<String, dynamic>;
    }
  }

  // Persist the store to a file
  void _save() {
    final file = File(_filePath);
    file.writeAsStringSync(jsonEncode(_store));
  }

  // Set a value for a given key
  void set(String key, dynamic value) {
    _store[key] = value;
    _save();
  }

  // Get the value associated with a key
  dynamic get(String key) {
    return _store[key];
  }

  // Delete a key and its associated value
  void delete(String key) {
    _store.remove(key);
    _save();
  }

  // Clear the entire store
  void clear() {
    _store.clear();
    _save();
  }
}

// function to return db
KeyValueStore getDB() {
  return KeyValueStore();
}
