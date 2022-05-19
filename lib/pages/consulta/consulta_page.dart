import 'package:alertaqueimada/model/denuncia_model.dart';
import 'package:alertaqueimada/repositories/denuncia.repository.dart';
import 'package:flutter/material.dart';

class ConsultaPage extends StatelessWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                  title: Text("${snapshot.data?[index] ?? ""}"),
                ),
              );
            }
          },
        ));
  }
}
