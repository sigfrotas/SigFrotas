import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_login.dart';
import 'package:sigfrotas/src/model/vault_data.dart';
import 'package:sigfrotas/src/services/service_login.dart';
import 'package:sigfrotas/src/utils/injector.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';
import 'package:sigfrotas/src/view/shared/form_validation.dart';
import 'package:sigfrotas/src/view/shared/link_button.dart';
import 'package:sigfrotas/src/view/shared/rounded_button.dart';
import 'package:sigfrotas/src/view/shared/widget/app_logo.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    @required this.setPosition,
    Key key,
  }) : super(key: key);
  final Function(int position, bool isAdmin) setPosition;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtRG, txtPass;
  final GlobalKey<State> _globalKey = GlobalKey<State>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    txtRG = TextEditingController(text: "");
    txtPass = TextEditingController(text: "");
    super.initState();
  }

  Future<void> _doLogin(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      // ignore: unawaited_futures
      Dialogs.showAwaitingDialog(context: context, key: _globalKey);

      try {
        final dio = Dio();
        final auth = ServiceLogin(dio);
        final result = await auth.login({
          "rgpm": txtRG.text,
          "pass": txtPass.text,
        });

        if (result != null && result is ModelLogin) {
          final vault = Vault();
          await vault.setAuthData(
            nome: result.nome,
            rgpm: result.rgpm,
            token: result.token,
            isAdmin: result.isAdmin,
          );

          ///Injeta Dio e services
          Injector.inject(result.token);
          Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
          final VaultData data = await Vault.getDefaultInfo();
          widget.setPosition(data.isAdmin ? 2 : 3, data.isAdmin);
        }
      } catch (e) {
        if (e is DioError) {
          print(e);
//          Get.snackbar("Falha ao conectar", e.response.data[0]['message']);
        } else {
          print(e);
        }

        Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: false,
          children: <Widget>[
            const SizedBox(height: 32),
            AppLogo(),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 2,
                color: Get.theme.cardColor,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: txtRG,
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: Strings.rgpm,
                            hintText: Strings.rgMilitar,
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 5,
                          validator: validateRGPM,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: txtPass,
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Senha",
                            hintText: 'Digite a senha',
                          ),
                          obscureText: true,
                          validator: validatePassword,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            RoundedButton(
              padding: const EdgeInsets.all(8),
              label: "Entrar",
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _doLogin(context);
              },
            ),
            LinkButton(
              label: "Cadastrar!",
              onPressed: () => widget.setPosition(1, false),
            ),
          ],
        ),
      ),
    );
  }
}
