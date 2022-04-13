import 'dart:convert';

import 'package:alertaqueimada/app_store.dart';
import 'package:alertaqueimada/model/denuncia_model.dart';
import 'package:alertaqueimada/pages/login/login_page.dart';
import 'package:alertaqueimada/model/usuario_model.dart';
import 'package:alertaqueimada/repositories/compass_repository.dart';
import 'package:alertaqueimada/repositories/geolocation_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../denuncia/denuncia_page.dart';
import '../usuario/usuario_foto_widget.dart';
import '../usuario/usuario_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UsuarioModel?>(
      valueListenable: usuario,
      builder: (context, usuario, widget) =>
     Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            visible: usuario == null,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),
                ));
              },
              icon: Icon(Icons.login)))
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await _denunciar(context);} ,
                  
                  icon: Icon(Icons.camera_alt),
                  label: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Tire uma foto'),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      textStyle: TextStyle(
                        fontSize: 18,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('Clique na câmera para enviar foto e local do incêndio!'),
                  )
              ],
            ),
          ],
        ),
      ),
       drawer: usuario == null ? null : _drawer(context, usuario),
    ));
  }
}

  _drawer(BuildContext context, UsuarioModel usuario) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      elevation: 5,
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              child: Card(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 55.0,
                          backgroundImage:
                              FotoUsuarioImage().getFotoWidget(usuario),
                        ),
                        Text("${usuario.nome}"),
                      ],
                    ),
                    Positioned(
                        right: 2,
                        top: 2,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      UsuarioPage(usuario: usuario)));
                            },
                            icon: Icon(Icons.edit)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String?> _tirarFoto() async {
    final ImagePicker _picker = ImagePicker();
    try{
       final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

        return photo!.readAsBytes().then((imagem) {

       
     
         return base64Encode(imagem);
       
      });
    } catch (e) {
      print("Erro selecionando a foto do usuário: $e");
    }
    
  }


  Future<void> _denunciar(BuildContext context)  async {
    String? foto = await _tirarFoto();  
    Position posicao = await GeolocationRepository().determinePosition();
    CompassEvent direcao = await CompassRepository().getEvent();
    DenunciaModel denuncia = DenunciaModel(foto:foto,posicao:posicao,direcao:direcao);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DenunciaPage(denuncia),));
    
  }


