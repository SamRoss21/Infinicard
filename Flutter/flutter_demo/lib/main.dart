import 'package:flutter/material.dart';
import 'models/bar.dart';
import 'models/textelement.dart';
import 'models/group.dart';
import 'models/img.dart';
import 'models/cards.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myBar = Bar("bar","bar1", Color.fromARGB(255, 103, 51, 103), title:"Susan B. Anthony");
    final text1 = TextElement("text","text1",Colors.black, "Bio");
    final text2 = TextElement("text","text1",const Color.fromARGB(255, 0, 0, 0), "Susan B. Anthony was born in ...");
    final img = Img("img","img1","assets/Susan-B-Anthony.jpeg", imgWidth: 100);
    final group =  Group("group", "group1", [myBar, img, text1, text2]);
    return  MaterialApp(home: Cards("card", "card1", [group]));
  }
}

//reflection 