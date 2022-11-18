import 'package:flutter/material.dart';
import 'package:ledgerfe/timeline/utilities/total_expense.dart';

import 'expense_pie_chart.dart';
import 'indication.dart';

class Representation extends StatefulWidget {
  const Representation({Key? key}) : super(key: key);

  @override
  State<Representation> createState() => _RepresentationState();
}

class _RepresentationState extends State<Representation> {
  final List<Widget> _rep=[
    const ExpensePieChart(),
    const Indication(),
    const TotalExpense(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rep,
    );
  }
}
