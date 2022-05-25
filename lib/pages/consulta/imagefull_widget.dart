import 'package:flutter/material.dart';

class ImagemFullWidget extends StatelessWidget {
  final String imagem;
    const ImagemFullWidget(this.imagem,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(child: Image.network(this.imagem)),
    );
  }
}