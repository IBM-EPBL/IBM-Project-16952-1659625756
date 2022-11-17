import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ledgerfe/timeline/utilities/pie_chart_sections.dart';

class ExpensePieChart extends StatefulWidget {
  const ExpensePieChart({Key? key}) : super(key: key);

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child:PieChart(
          PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 5,
            centerSpaceRadius: 50,
            sections: getSections(),
          ),
        ),
      ),
    );
  }
}
