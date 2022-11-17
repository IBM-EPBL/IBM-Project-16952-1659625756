import 'package:flutter/material.dart';

class PieData {
  static Map<String,Color?> legendColor = {
    "food": Color(0xff800000),
    "transport": Color(0xff9A6324),
    "apparel": Color(0xff808000),
    "education": Color(0xff469990),
    "social_life": Color(0xff000075),
    "culture": Color(0xffe6194B),
    "beauty": Color(0xfffabed4),
    "gift": Color(0xfff58231),
    "self_development": Color(0xff4363d8),
    "household": Color(0xff7ba900),
    "health": Color(0xffaf9900),
    "other": Color(0xff911eb4)
  };
  static List<Data> data = [
    Data(tag: "food", percent: 8.33,color: legendColor["food"]!),
    Data(tag: "transport", percent: 8.33,color: legendColor["transport"]!),
    Data(tag: "apparel", percent: 8.33,color: legendColor["apparel"]!),
    Data(tag: "education", percent: 8.33,color: legendColor["education"]!),
    Data(tag: "social_life", percent: 8.33,color: legendColor["social_life"]!),
    Data(tag: "culture", percent: 8.33,color: legendColor["culture"]!),
    Data(tag: "beauty", percent: 8.33,color: legendColor["beauty"]!),
    Data(tag: "gift", percent: 8.33,color: legendColor["gift"]!),
    Data(tag: "self_development", percent: 8.33,color: legendColor["self_development"]!),
    Data(tag: "household", percent: 8.33,color: legendColor["household"]!),
    Data(tag: "health", percent: 8.33,color: legendColor["health"]!),
    Data(tag: "other", percent: 8.33,color: legendColor["other"]!)
  ];
}

class Data{
  final String tag;
  final double percent;
  final Color color;
  Data({required this.tag,required this.percent,required this.color});
}