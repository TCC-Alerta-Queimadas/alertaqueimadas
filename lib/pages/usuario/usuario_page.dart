import 'package:flutter/material.dart';
import '../../model/usuario_model.dart';
import 'usuario_form.dart';




class UsuarioPage extends StatelessWidget {
   final UsuarioModel? usuario; 
  const UsuarioPage({this.usuario, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Perfil"),
      ),
     
        body: UsuarioForm(usuario:usuario,)
    );
  }
}
