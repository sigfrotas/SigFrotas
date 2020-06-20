import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_login.dart';
import 'package:sigfrotas/src/services/service_login.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';
import 'package:sigfrotas/src/view/shared/form_validation.dart';
import 'package:sigfrotas/src/view/shared/link_button.dart';
import 'package:sigfrotas/src/view/shared/rounded_button.dart';
import 'package:sigfrotas/src/view/shared/widget/app_logo.dart';

class ViewSignin extends StatefulWidget {
  const ViewSignin({
    @required this.setPosition,
    Key key,
  }) : super(key: key);

  final Function(int position, bool isAdmin) setPosition;

  @override
  _ViewSigninState createState() => _ViewSigninState();
}

class _ViewSigninState extends State<ViewSignin> {
  TextEditingController txtRg, txtPass, txtUsername, txtPassConfirm;
  String emailError;
  final _globalKey = GlobalKey<State>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    txtRg = TextEditingController();
    txtPass = TextEditingController();
    txtUsername = TextEditingController();
    txtPassConfirm = TextEditingController();
    emailError = "";
    super.initState();
  }

  Future _doSignin(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      // ignore: unawaited_futures
      Dialogs.showAwaitingDialog(context: context, key: _globalKey);
      try {
        final dio = Dio();
        final client = ServiceLogin(dio);
        final result = await client.register(
          {
            "nome": txtUsername.text.trim(),
            "rgpm": txtRg.text.trim(),
            "pass": txtPass.text.trim(),
            "isAdmin": false,
          },
        );

        if (result is ModelLogin) {
          final vault = Vault();
          await vault.setAuthData(
            nome: result.nome,
            rgpm: result.rgpm,
            token: result.token,
            isAdmin: result.isAdmin,
          );
          Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
          widget.setPosition(3, await Vault.getIsAdmin());
        }
      } catch (e) {
        if (e is DioError) {
          Get.snackbar("Falha ao conectar", e.response.data[0]['message']);
        }
      }

      Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: false,
          children: <Widget>[
            const SizedBox(height: 16),
            AppLogo(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: txtUsername,
                          autofocus: false,
                          validator: validateUsername,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nome",
                            hintText: 'José da Silva',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          autofocus: false,
                          controller: txtRg,
                          validator: validateRGPM,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: Strings.rgpm,
                              hintText: Strings.rgMilitar,
                              counterText: ""),
                          maxLength: 5,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          autofocus: false,
                          controller: txtPass,
                          validator: validatePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Senha",
                            hintText: 'Digite a senha',
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          autofocus: false,
                          controller: txtPassConfirm,
                          validator: validatePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: Strings.senhaConfirmar,
                            hintText: Strings.senhaConfirmar,
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            RoundedButton(
              padding: const EdgeInsets.all(8),
              label: "Cadastrar!",
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _doSignin(context);
              },
            ),
            LinkButton(
              label: "Voltar",
              onPressed: () => widget.setPosition(0, false),
            ),
          ],
        ),
      ),
    );
  }
}
