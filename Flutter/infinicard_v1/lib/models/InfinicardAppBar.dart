import 'package:flutter/material.dart';

class InfinicardAppBar extends StatefulWidget {
  final Map params; //user specified parameters

  final List<String> argNames = ['key','leading','title','actions','toolbarHeight','backgroundColor',
  'centerTitle','leadingWidth','titleTextStyle'];

  var args = Map();
  var defaults = Map(); //our default arguments

  InfinicardAppBar(this.params){
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
  _InfinicardAppBarState createState() => _InfinicardAppBarState();

}

class _InfinicardAppBarState extends State<InfinicardAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(key:widget.args["key"], leading:widget.args["leading"], 
    title:widget.args["title"], actions:widget.args["actions"],
    backgroundColor:widget.args["backgroundColor"], centerTitle:widget.args["centerTitle"], 
    toolbarHeight:widget.args["toolbarHeight"], leadingWidth:widget.args["leadingWidth"], 
    toolbarTextStyle:widget.args["toolbarTextStyle"]);
  }
}