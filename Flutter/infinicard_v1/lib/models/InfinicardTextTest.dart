import 'package:flutter/material.dart';

class InfinicardTextTest{
  String data = "";
  TextStyle textStyle = const TextStyle();
  TextAlign textAlign = TextAlign.left; 

  InfinicardTextTest(this.data);

  void style(TextStyle? style){
    textStyle = style ?? const TextStyle();
  }

  void align(TextAlign textAlign){
    textAlign = textAlign;
  }

  bool unstyled(){
    return (textStyle == const TextStyle()) ? true : false;
  }

  Text text(){
    return Text(data, style: textStyle, textAlign: textAlign);
  }

}

class iText extends StatefulWidget {
  InfinicardTextTest text;

  iText(this.text, {super.key});

  @override
  State<iText> createState() => _iTextState();
}

class _iTextState extends State<iText> {
  @override
  Widget build(BuildContext context) {
    if(widget.text.unstyled()) {widget.text.style(Theme.of(context).textTheme.displayLarge);}
    return widget.text.text();
  }
}