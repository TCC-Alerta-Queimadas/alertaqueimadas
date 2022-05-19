import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/denuncia_model.dart';

class DenunciaRepository {
  Future<void> salvar(DenunciaModel denuncia) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> col =
        firestore.collection("denuncias");

    if ((denuncia.id ?? "").isNotEmpty) {
      await col.doc(denuncia.id).update(denuncia.toJson());
    } else {
      DocumentReference<Map<String, dynamic>> doc =
          await col.add(denuncia.toJson());
      await doc.set({"id": doc.id});
      denuncia.id = doc.id;
    }
    if (denuncia.foto != null) {
      var filename = denuncia.id! + ".jpg";
      var ref = FirebaseStorage.instance.ref(filename);
      await ref.putData(base64Decode(denuncia.foto!));
      var url = await ref.getDownloadURL();
      await col.doc(denuncia.id).update({'foto': url});
    }
  }

  Future<List<DenunciaModel>> listaDenuncias() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> col =
        firestore.collection("denuncias");
    QuerySnapshot<Map<String, dynamic>> denuncias = await col.get();

    return denuncias.docs.map((e) {
      return DenunciaModel.fromMap(e.data());
    }).toList();
  }
}
