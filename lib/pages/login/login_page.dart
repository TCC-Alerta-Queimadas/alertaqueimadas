import 'package:alertaqueimada/app_store.dart';
import 'package:alertaqueimada/model/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _MainPageState();
}

class _MainPageState extends State<LoginPage> {
  autenticacao() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('Usuário fez logout!');
        usuario.value = null;
      } else {
        print('Usuario fez SigIn!');
        var snapshot =
            FirebaseFirestore.instance.collection('usuarios').doc(user.uid);
        var fbUser = (await snapshot.get()).data();
        if (fbUser != null) {
          usuario.value = UsuarioModel(
              id: user.uid,
              nome: fbUser['nome'],
              email: user.email,
              foto: fbUser['foto']);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    autenticacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: LoginWidget());
  }
}
