import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapaWidget extends StatefulWidget {
  int id;
  Position posicao;
  CompassEvent direcao;
  MapaWidget(this.id, this.posicao, this.direcao, {Key? key}) : super(key: key);

  @override
  State<MapaWidget> createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  MapController mapController = MapController();


  @override
  void initState() {
    super.initState();
     mapController = MapController();
  }

  
  
  @override
  Widget build(BuildContext context) {
    LatLng pos = LatLng(widget.posicao.latitude, widget.posicao.longitude,);
    return Container(
      height: 300,
      child: FlutterMap(
        mapController: mapController,
        key: Key("map${widget.id}}"),
        options: MapOptions(
          center: pos,
          zoom: 13.0,
          onPositionChanged: (mapPosition, alterar){
            mapController.move(pos, 13);
          }
          
          
        ),
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
                builder: (ctx) => Container(
                  child: GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                            'https://www.google.com/maps?saddr&daddr=${widget.posicao.latitude},${widget.posicao.longitude}');
                        if (!await launchUrl(_url))
                          throw 'Não foi possivel abrir a rota.';
                      },
                      child: Transform.rotate(angle: widget.direcao.heading??0.0,
                          child: Icon(
                            Icons.arrow_upward_sharp,
                            color: Colors.red,
                          ))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
