import 'package:flutter/material.dart';
import 'package:sigfrotas/src/model/vault_data.dart';
import 'package:sigfrotas/src/utils/injector.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/admin/view_admin.dart';
import 'package:sigfrotas/src/view/motorista/view_motorista.dart';
import 'package:sigfrotas/src/view/shared/login/view_login.dart';
import 'package:sigfrotas/src/view/shared/signin/view_signin.dart';

class BranchView extends StatefulWidget {
  const BranchView({
    @required this.data,
    Key key,
  }) : super(key: key);

  final VaultData data;

  @override
  _BranchViewState createState() => _BranchViewState();
}

class _BranchViewState extends State<BranchView> with SingleTickerProviderStateMixin {
  int position;
  bool isAdmin;

  @override
  void initState() {
    isAdmin = widget.data.isAdmin;
    if (widget.data.token.isEmpty) {
      position = 0;
    } else {
      position = isAdmin ? 2 : 3;
    }

    super.initState();
  }

  Widget getActualView(int pos, bool isAdmin) {
    switch (pos) {
      case 0:
        return LoginView(setPosition: setPosition);
        break;
      case 1:
        return ViewSignin(setPosition: setPosition);
        break;
      case 2:
        Injector.inject(widget.data.token);
        return ViewAdmin();
        break;
      case 3:
        Injector.inject(widget.data.token);
        return ViewMotorista();
      default:
        return Container(
          color: Theme.of(context).accentColor,
        );
    }
  }

  Future<String> findToken() async {
    return await Vault.getToken();
  }

  void setPosition(int position, bool isAdmin) {
    setState(() {
      this.position = position;
      this.isAdmin = isAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: getActualView(position, isAdmin),
      duration: const Duration(milliseconds: 400),
    );
  }
}

// class BranchView extends StatefulWidget {
//   @override
//   _BranchViewState createState() => _BranchViewState();
// }

// class _BranchViewState extends State<BranchView> {
//   Widget getActualView(int pos) {
//     switch (pos) {
//       case 0:
//         return LoginView(setPosition: setPosition);
//         break;
//       case 1:
//         return ViewSignin(setPosition: setPosition);
//         break;
//       case 2:
//         return FutureObserver<List<Empregos>>(
//           future: DaoEmpregos.fetchAll(),
//           onSuccess: (_, List<Empregos> empregos) {
//             return Provider<BlocMain>(
//               create: (_) => BlocMain(
//                 token: widget.token,
//                 empregos: empregos,
//               ),
//               dispose: (_, BlocMain b) => b.dispose(),
//               child: const ViewHome(),
//             );
//           },
//         );
//         break;
//       default:
//         return Container(
//           color: Theme.of(context).accentColor,
//         );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FutureObserver<Map<String, Object>>(
//           future: Vault.getDefaultInfo(),
//           onSuccess: (_, data) {},
//         ),
//       ),
//     );
//   }
// }
