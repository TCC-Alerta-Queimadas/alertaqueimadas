import 'package:alertaqueimada/model/denuncia_model.dart';
import 'package:alertaqueimada/pages/denuncia/denuncia_store.dart';
import 'package:alertaqueimada/repositories/denuncia.repository.dart';
import 'package:flutter/material.dart';

import 'denuncia_foto_widget.dart';

class DenunciaPage extends StatelessWidget {
  final DenunciaModel denuncia;
  final DenunciaStore denunciaStore = DenunciaStore();
  DenunciaPage(
    this.denuncia, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(valueListenable: denunciaStore.registrado,builder: (context,registrado,widget){
      return !registrado?
      Column(
        children: [Image(image: FotoDenunciaImage().getFotoWidget(denuncia))],
      ):Center(
        child: 
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_box_rounded, color: Colors.green, size: 60,),
            Text("Denúncia enviada")
          ],
        ),
      );

      },),  
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () async {
          if (denunciaStore.registrado.value) {

            Navigator.pop(context);


          } else          {
          try {
            await DenunciaRepository().salvar(denuncia);
            denunciaStore.registrado.value=true;
          } catch (e) {
            print(e);
          }
          }
        },
      ),
    );
  }
}
