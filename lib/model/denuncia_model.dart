import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class DenunciaModel {
  String? foto;
  String? id;

  Position? posicao;
  CompassEvent? direcao;
  DenunciaModel({this.id, this.foto, this.posicao, this.direcao});

  Map<String, dynamic> toJson() {
    return {
      "posicao": posicao!.toJson(),
      "direcao": {"heading": direcao?.heading?.toStringAsFixed(4) ?? 0.0}
    };
  }

  factory DenunciaModel.fromMap(Map<String, dynamic> reg) {
    return DenunciaModel(
      id: reg['id'] ?? "",
      direcao: reg['direcao'] ?? "",
      foto: reg['foto'] ?? "",
    );
  }
}
