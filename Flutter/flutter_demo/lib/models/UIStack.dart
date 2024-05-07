import 'package:flutter/material.dart';

class UIStack extends StatefulWidget {
  final Map params;

  final List<String> argNames = ["key", "children"];
  var args = Map();

  //var defaults = Map();

  UIStack(this.params){
    //get null values for parameters
    for(var arg in argNames){
      args[arg] = null; 
    }

    //override values when user specifies
    for(var key in params.keys){
      args[key] = params[key]; 
    }

  }

  @override
  _UIStackState createState() => _UIStackState();
}

class _UIStackState extends State<UIStack> {
  @override
  Widget build(BuildContext context) {

    return Stack(key:widget.args["key"], children:widget.args["children"]);
  }

}
