import 'dart:convert';

import 'package:alertaqueimada/model/usuario_model.dart';
import 'package:flutter/material.dart';


class FotoUsuarioImage   {
  
  getFotoWidget(UsuarioModel usuario){

    if(usuario!=null && usuario.foto != null){
      if(usuario.foto!.contains("https")) {
        return NetworkImage(usuario.foto!);
      } else {
        return MemoryImage(base64Decode(usuario.foto!));
      }
    } else{
      return ExactAssetImage("image/pessoa.png");

    }
    
  }
 

    

}