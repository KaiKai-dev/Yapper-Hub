import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._internal();
  static final StorageService instance = StorageService._internal();

  SharedPreferences? _storage;
  FlutterSecureStorage? _secureStorage;

  SharedPreferences? get storage => _storage;
  FlutterSecureStorage? get secureStorage => _secureStorage;

  Future<void> init() async {
    _storage = await SharedPreferences.getInstance();
    _secureStorage = FlutterSecureStorage();
  }

  /// Get Functions
  String? get(String key) => _storage!.getString(key);
  List<String>? getList(String key) => _storage!.getStringList(key);
  bool getBool(String key) => _storage!.getBool(key)!;

  Future<String?> securedGet(String key) async =>
      await _secureStorage!.read(key: key);
  Future<Map<String, dynamic>>? securedShowAll(String key) async =>
      await _secureStorage!.readAll();

  /// Store Functions
  void storeString(String key, String value) async =>
      await _storage!.setString(key, value);
  void storeStringList(String key, List<String> value) async =>
      await _storage!.setStringList(key, value);
  void storeBool(String key, bool value) async =>
      await _storage!.setBool(key, value);
  void storeDouble(String key, double value) async =>
      await _storage!.setDouble(key, value);

  void secureStore(String key, String value) async =>
      await _secureStorage!.write(key: key, value: value);

  /// Delete Functions
  Future<bool> delete(String key) async => await _storage!.remove(key);
  Future<void> secureDelete(String key) async => await _secureStorage!.delete(key: key);

  /// Reset Functions
  void reset() => _storage!.clear();
  void secureReset() => _secureStorage!.deleteAll();
}
