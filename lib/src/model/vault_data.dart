import 'package:flutter/foundation.dart';

@immutable
class VaultData {
  const VaultData({
    this.token,
    this.nome,
    this.rgpm,
    this.isAdmin,
  });
  final String token, nome, rgpm;
  final bool isAdmin;
}
