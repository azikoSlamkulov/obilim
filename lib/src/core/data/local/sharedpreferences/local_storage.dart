import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesDB {
  String? getString({required String key});

  Future<bool>? setString({
    required String key,
    required String value,
  });

  Future<bool>? remove({required String key});

  Future<bool>? clear();

  bool? getBool({required String key});

  Future<bool>? setBool({required String key, required bool value});
}

class SharedPreferencesImpl implements SharedPreferencesDB {
  SharedPreferencesImpl({required this.preferencesCore});
  SharedPreferences? preferencesCore;

  // get string
  @override
  String? getString({required String key}) {
    return preferencesCore!.getString(key);
  }

  // put string
  @override
  Future<bool>? setString({
    required String key,
    required String value,
  }) {
    return preferencesCore!.setString(key, value);
  }

  // clear string
  @override
  Future<bool>? remove({required String key}) {
    return preferencesCore!.remove(key);
  }

  // clear string
  @override
  Future<bool>? clear() {
    return preferencesCore!.clear();
  }

  // get bool
  @override
  bool? getBool({required String key}) {
    return preferencesCore!.getBool(key);
  }

  // put bool
  @override
  Future<bool>? setBool({required String key, required bool value}) async {
    return await preferencesCore!.setBool(key, value);
  }
}

// class LocalStorage {
//   static LocalStorage? _localStorage;
//   static SharedPreferences? _preferences;

//   static Future<LocalStorage> initLocalStorage() async {
//     if (_localStorage == null) {
//       final secureStorage = LocalStorage._();
//       await secureStorage._init();
//       _localStorage = secureStorage;
//     }
//     return _localStorage!;
//   }

//   LocalStorage._();

//   Future _init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }

//   // get string
//   static String? getString({required String key}) {
//     return _preferences!.getString(key);
//   }

//   // put string
//   static Future<bool>? setString({
//     required String key,
//     required String value,
//   }) {
//     return _preferences!.setString(key, value);
//   }

//   // clear string
//   static Future<bool>? remove({required String key}) {
//     return _preferences!.remove(key);
//   }

//   // clear string
//   static Future<bool>? clear() {
//     return _preferences!.clear();
//   }

//   // get bool
//   static bool? getBool({required String key}) {
//     return _preferences!.getBool(key);
//   }

//   // put bool
//   static Future<bool>? setBool(
//       {required String key, required bool value}) async {
//     return await _preferences!.setBool(key, value);
//   }
// }
