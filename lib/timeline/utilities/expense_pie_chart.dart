import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ledgerfe/timeline/utilities/pie_chart_sections.dart';

import '../services/pie_data.dart';

class ExpensePieChart extends StatefulWidget {
  final PieData fetchedData;
  const ExpensePieChart({Key? key, required this.fetchedData}) : super(key: key);

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: MediaQuery.of(context).size.width*0.25,
          sections: getSections(widget.fetchedData),
        ),
      ),
    );
  }
}
