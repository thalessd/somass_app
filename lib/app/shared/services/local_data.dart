import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  // LS = Local Storage

  final _lsKeyCpf = "cpf";
  final _lsKeyFullName = "fullName";
  final _lsKeyEscorts = "escorts";
  final _lsKeyToken = "token";

  Future<SharedPreferences> _sharedPreferences;

  LocalData() {
    this._sharedPreferences = SharedPreferences.getInstance();
  }

  Future<bool> setCPF(String cpf) async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.setString(_lsKeyCpf, cpf);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getCPF() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.getString(_lsKeyCpf);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> removeCPF() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.remove(_lsKeyCpf);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> setFullName(String fullName) async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.setString(_lsKeyFullName, fullName);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getFullName() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.getString(_lsKeyFullName);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> removeFullName() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.remove(_lsKeyFullName);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> setEscorts(List<String> escorts) async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.setStringList(_lsKeyEscorts, escorts);
    } catch (e) {
      throw e;
    }
  }

  Future<List<String>> getEscorts() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.getStringList(_lsKeyEscorts);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> removeEscorts() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.remove(_lsKeyFullName);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> setToken(String token) async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.setString(_lsKeyToken, token);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getToken() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.getString(_lsKeyToken);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> removeToken() async {
    try {
      final prefs = await this._sharedPreferences;
      return prefs.remove(_lsKeyToken);
    } catch (e) {
      throw e;
    }
  }
}
