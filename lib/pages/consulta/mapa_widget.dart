import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


class MapaWidget extends StatefulWidget {
  Position posicao;
  MapaWidget(this.posicao,{Key? key}) : super(key: key);

  @override
  State<MapaWidget> createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  //MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    LatLng pos = LatLng(widget.posicao.latitude,widget.posicao.longitude);
  return FlutterMap(
    
    options: MapOptions(
      center: pos,
      zoom: 13.0,
    ),/*
    layers: [
      TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c'],
        attributionBuilder: (_) {
          return Text("© OpenStreetMap contributors");
        },
      ),
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: pos,
            builder: (ctx) =>
            Container(
              child: Icon(Icons.camera),
            ),
          ),
        ],
      ),
    ],*/
  );
}
}