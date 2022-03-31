import 'package:flutter_compass/flutter_compass.dart';

class CompassRepository{
  Future<CompassEvent> getEvent() async {
     return  await FlutterCompass.events!.first;
  }
}