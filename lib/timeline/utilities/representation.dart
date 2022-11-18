import 'package:flutter/material.dart';
import 'package:ledgerfe/timeline/services/pie_data.dart';
import 'package:ledgerfe/timeline/utilities/total_expense.dart';

import 'expense_pie_chart.dart';
import 'indication.dart';

class Representation extends StatelessWidget {
  final PieData fetchedData;
  final double total;
  const Representation({Key? key, required this.fetchedData, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpensePieChart(fetchedData: fetchedData),
        Indication(fetchedData: fetchedData,),
        TotalExpense(total:total),
      ],
    );
  }
}

