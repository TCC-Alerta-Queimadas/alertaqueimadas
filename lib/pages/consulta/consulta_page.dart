import 'package:alertaqueimada/model/denuncia_model.dart';
import 'package:alertaqueimada/pages/consulta/imagefull_widget.dart';
import 'package:alertaqueimada/pages/main/main_page.dart';
import 'package:alertaqueimada/repositories/denuncia.repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repositories/usuario.repository.dart';
import 'mapa_widget.dart';

class ConsultaPage extends StatelessWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Expanded(child: Row(  
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  
                  alignment: Alignment.bottomRight,
                  child:  IconButton(
                    onPressed: () {

                            logout();
                          },
                  icon: const Icon(Icons.logout, color: Colors.red,),),
                )
              ],
            )),
          ],
             ),            
        body: FutureBuilder<List<DenunciaModel>>(
          initialData: [],
          future: DenunciaRepository().listaDenuncias(),
          builder: (context, snapshot) {
            print("snapshot hasdata ${snapshot.hasData}");
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.amber)));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => ListTile(
                  title: Stack(
                    children: [
            
                      snapshot.data![index].posicao==null?Container():MapaWidget(
                        index, 
                        snapshot.data![index].posicao!,snapshot.data![index].direcao!),
                        Positioned(
                          bottom: 0,
                          right: -30,
                          child: SizedBox(height:150, width:150, child:   GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ImagemFullWidget("${snapshot.data?[index].foto}"),
                                )),
                            child: Image.network("${snapshot.data?[index].foto}",fit: BoxFit.cover,)))),
                      
                    ],
                  ),
                  
                ),
              );
            }
          },
        ));
  }
}

logout() async {

    await FirebaseAuth.instance.signOut();

  }

