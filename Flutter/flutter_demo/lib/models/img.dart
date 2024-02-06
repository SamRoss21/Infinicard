import 'package:flutter/material.dart';

class Img extends StatefulWidget {
  final String type;
  final String id;
  final String path;
  final double imgWidth;

  Img(this.type, this.id, this.path, {this.imgWidth = 100});

  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(widget.path), width: widget.imgWidth,);
  }
}
