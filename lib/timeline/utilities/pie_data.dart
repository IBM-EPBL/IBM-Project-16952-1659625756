import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(tag: "food", percent: 40,color: const Color(0xff0293ee)),
    Data(tag: "transportation", percent: 30,color: const Color(0xffee8802)),
    Data(tag: "apparel", percent: 15,color: const Color(0xffcfee02)),
    Data(tag: "culture", percent: 15,color: const Color(0xffee0280)),
  ];
}

class Data{
  final String tag;
  final double percent;
  final Color color;
  Data({required this.tag,required this.percent,required this.color});
}