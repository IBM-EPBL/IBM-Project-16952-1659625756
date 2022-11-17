import 'package:flutter/material.dart';

class TotalExpense extends StatefulWidget {
  const TotalExpense({Key? key}) : super(key: key);

  @override
  State<TotalExpense> createState() => _TotalExpenseState();
}

class _TotalExpenseState extends State<TotalExpense> {
  int expVal=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.3,
      height: MediaQuery.of(context).size.height*0.1,
      child: DecoratedBox(
        child: Text(
          "Total Expenditure:₹${expVal}",
        ),
        decoration: const BoxDecoration(
          color: const Color(0xFF5BA66E),
        ),
      )
    );
  }
}
