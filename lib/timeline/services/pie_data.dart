import 'package:flutter/material.dart';

class PieData {
   static Map<String,Color?> legendColor = {
    "food": const Color(0xff800000),
    "transport": const Color(0xff9A6324),
    "apparel": const Color(0xff808000),
    "education": const Color(0xff469990),
    "social_life": const Color(0xff000075),
    "culture": const Color(0xffe6194B),
    "beauty": const Color(0xfffabed4),
    "gift": const Color(0xfff58231),
    "self_development": const Color(0xff4363d8),
    "household": const Color(0xff7ba900),
    "health": const Color(0xffaf9900),
    "other": const Color(0xff911eb4)
  };
   late List<Data> data;
   List<double> percent;
   PieData({required this.percent}){
     data = [
       Data(tag: "food", percent: percent[0],color: legendColor["food"]!),
       Data(tag: "transport", percent: percent[1],color: legendColor["transport"]!),
       Data(tag: "apparel", percent: percent[2],color: legendColor["apparel"]!),
       Data(tag: "education", percent: percent[3],color: legendColor["education"]!),
       Data(tag: "social_life", percent: percent[4],color: legendColor["social_life"]!),
       Data(tag: "culture", percent: percent[5],color: legendColor["culture"]!),
       Data(tag: "beauty", percent: percent[6],color: legendColor["beauty"]!),
       Data(tag: "gift", percent: percent[7],color: legendColor["gift"]!),
       Data(tag: "self_development", percent: percent[8],color: legendColor["self_development"]!),
       Data(tag: "household", percent: percent[9],color: legendColor["household"]!),
       Data(tag: "health", percent: percent[10],color: legendColor["health"]!),
       Data(tag: "other", percent: percent[11],color: legendColor["other"]!)
     ];
   }
}

class Data{
  final String tag;
  final double percent;
  final Color color;
  Data({required this.tag,required this.percent,required this.color});
}