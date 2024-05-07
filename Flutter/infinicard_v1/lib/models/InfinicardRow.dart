import 'package:flutter/material.dart';

class InfinicardRow extends StatefulWidget {
  final Map params;

  final List<String> argNames = [
    'key',
    'mainAxisAlignment',
    'mainAxisSize',
    'crossAxisAlignment',
    'children'
  ];

  var args = Map();
  var defaults = Map(); //our default arguments

  InfinicardRow(this.params) {
    //get null values for parameters
    for (var arg in argNames) {
      switch(arg){
        case "mainAxisAlignment":
          args[arg] = MainAxisAlignment.start;
          break;
        case "mainAxisSize":
          args[arg] = MainAxisSize.max;
          break;
        case "crossAxisAlignment":
          args[arg] = CrossAxisAlignment.center;
          break;
        default:
          args[arg] = null; 
      }
    }

    //override our/flutter's default values when user specifies
    for (var key in params.keys) {
      if (args.containsKey(key)) {
        args[key] = params[key];
      }
    }
  }

  @override
  _InfinicardRowState createState() => _InfinicardRowState();
}

class _InfinicardRowState extends State<InfinicardRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
        key: widget.args['key'],
        mainAxisAlignment: widget.args['mainAxisAlignment'],
        mainAxisSize: widget.args['mainAxisSize'],
        crossAxisAlignment: widget.args['crossAxisAlignment'],
        children: widget.args['children']);
  }
}