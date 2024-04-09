import 'package:flutter/material.dart';

class InfinicardImage extends StatefulWidget {
  final Map params;

  final List<String> argNames = ['key', 'width', 'height','path', 'semanticLabel'];

  var args = Map();
  var defaults = Map(); //our default arguments

  InfinicardImage(this.params){
    //get null values for parameters
    for(var arg in argNames){
      args[arg] = null; 
    }

    //override our/flutter's default values when user specifies
    for(var key in params.keys){
      if(args.containsKey(key)){
        args[key] = params[key]; 
      }
    }
  }

@override
  _InfinicardImageState createState() => _InfinicardImageState();

}

class _InfinicardImageState extends State<InfinicardImage> {
  @override
  Widget build(BuildContext context) {

    return Image(image: AssetImage(widget.args['path']), width:widget.args['width'], 
    height:widget.args['height'], semanticLabel:widget.args['semanticLabel'],);
  }
}