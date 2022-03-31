import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class DenunciaModel {
  String? foto;
  int? id;

  Position? posicao;
  CompassEvent? direcao;
  DenunciaModel({this.id,this.foto,this.posicao,this.direcao});
}