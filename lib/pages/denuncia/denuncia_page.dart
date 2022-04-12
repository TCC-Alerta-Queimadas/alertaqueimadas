import 'package:alertaqueimada/model/denuncia_model.dart';
import 'package:alertaqueimada/repositories/denuncia.repository.dart';
import 'package:flutter/material.dart';

import 'denuncia_foto_widget.dart';

class DenunciaPage extends StatelessWidget {
  final DenunciaModel denuncia;
  const DenunciaPage(
    this.denuncia, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Image(image: FotoDenunciaImage().getFotoWidget(denuncia))],
    ),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.done),onPressed: () async {
      await DenunciaRepository().salvar(denuncia);
    },),
     );
  }
}
