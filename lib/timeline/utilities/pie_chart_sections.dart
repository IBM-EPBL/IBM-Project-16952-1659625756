import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ledgerfe/timeline/utilities/pie_data.dart';

List<PieChartSectionData> getSections() => PieData.data
    .asMap().map<int,PieChartSectionData>((index,data){
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: "${data.percent}",
        titleStyle: TextStyle(
          fontSize: 16,
          color: const Color(0xffffffff),
        ),
      );
      return MapEntry(index, value);
  }).values.toList();