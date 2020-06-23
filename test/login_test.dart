import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/server/model_login.dart';
import 'package:sigfrotas/src/services/service_login.dart';

void main() {
  final dio = Dio();
  final service = ServiceLogin(dio);

  test('register', () async {
    final result = await service.register(
      {
        "nome": "Peçanha da Silva Santos",
        "rgpm": "66666",
        "pass": "123456",
        "isAdmin": true,
      },
    );

    print(result.toJson());
  });

  test('login', () async {
    try {
      final ModelLogin result = await service.login(
        {
          "rgpm": "22222",
          "pass": "123456",
        },
      );
      print(result);
    } catch (e) {
      print(e);
    }
  });

  test('test', () {
    assert(1 + 1 == 2);
  });
}
