import 'package:flutter/material.dart';

class InfinicardText extends StatefulWidget {
  final Map params;

  final List<String> argNames = ['key', 'data', 'style', 'textAlign'];

  var args = Map();
  var defaults = Map(); //our default arguments

  InfinicardText(this.params){
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
  _InfinicardTextState createState() => _InfinicardTextState();

}

class _InfinicardTextState extends State<InfinicardText> {
  @override
  Widget build(BuildContext context) {

    return Text(widget.args['data'], key:widget.args['key'], style:widget.args['style'], 
    textAlign:widget.args['textAlign']);
  }
}