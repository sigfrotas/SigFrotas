import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sigfrotas/src/model/vault_data.dart';

class Vault {
  Vault();

  static const String TOKEN = "sigfrotas_token";
  static const String NOME = "sigfrotas_nome";
  static const String RGPM = "sigfrotas_RGPM";
  static const String IS_ADMIN = "sigfrotas_isadmin";
  static const String LAST_INSERTED = "sigfrotas_last_insert";

  static FlutterSecureStorage _getStorage() {
    return const FlutterSecureStorage();
  }

  Future<Map<String, dynamic>> _getAllValues() async {
    final storage = _getStorage();
    return await storage.readAll();
  }

  Future<bool> hasSetToken() async {
    final allValues = await _getAllValues();
    return allValues.containsKey(TOKEN);
  }

  //implementar rotina de refresh_token
/*
  Future<bool> hasSetRefreshToken() async {
    final v = await _getAllValues();
    return v.containsKey(REFRESH_TOKEN);
  }

  Future<void> setRefreshToken(String refreshToken) {
    final store = _getStorage();
    return store.write(
      key: REFRESH_TOKEN,
      value: refreshToken,
    );
  }

  Future<String> getRefreshToken() async {
    final store = _getStorage();
    return await store.read(key: REFRESH_TOKEN);
  }

  */

  Future<void> setToken(String token) async {
    final store = _getStorage();
    return store.write(
      key: TOKEN,
      value: token,
    );
  }

  Future<void> setNome(String email) {
    final storage = _getStorage();
    return storage.write(key: NOME, value: email);
  }

  Future<void> setRGPM(String rgpm) {
    final storage = _getStorage();
    return storage.write(key: RGPM, value: rgpm);
  }

  Future<void> setIsAdmin(bool isAdmin) {
    final st = _getStorage();
    return st.write(key: IS_ADMIN, value: isAdmin.toString());
  }

  Future<void> setAuthData({
    @required String nome,
    @required String rgpm,
    @required String token,
    @required bool isAdmin,
  }) async {
    await Future.wait([
      setNome(nome),
      setRGPM(rgpm),
      setIsAdmin(isAdmin),
      setToken(token),
    ]);
  }

  static Future<String> getToken() async {
    final store = _getStorage();
    return await store.read(key: TOKEN) ?? "";
  }

  static Future<String> getNome() async {
    final store = _getStorage();
    return await store.read(key: NOME);
  }

  static Future<String> getRGPM() async {
    final store = _getStorage();
    return await store.read(key: RGPM);
  }

  static Future<bool> getIsAdmin() async {
    final store = _getStorage();
    final result = await store.read(key: IS_ADMIN);
    return result == "true";
  }

  static Future<VaultData> getDefaultInfo() async {
    final values = await Future.wait([
      getNome(),
      getRGPM(),
      getToken(),
      getIsAdmin(),
    ]);
    return VaultData(
      nome: values[0] as String,
      rgpm: values[1] as String,
      token: values[2] as String,
      isAdmin: values[3] as bool,
    );
  }
}
