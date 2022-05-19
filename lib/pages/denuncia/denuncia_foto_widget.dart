import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/denuncia_model.dart';

class FotoDenunciaImage {
  ImageProvider getFotoWidget(DenunciaModel denuncia) {
    if (denuncia.foto != null) {
      if (denuncia.foto!.contains("https")) {
        return NetworkImage(denuncia.foto!);
      } else {
        return MemoryImage(base64Decode(denuncia.foto!));
      }
    } else {
      return ExactAssetImage("image/pessoa.png");
    }
  }
}
