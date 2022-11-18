import 'package:flutter/material.dart';

class TotalExpense extends StatefulWidget {
  final double total;
  const TotalExpense({Key? key, required this.total}) : super(key: key);

  @override
  State<TotalExpense> createState() => _TotalExpenseState();
}

class _TotalExpenseState extends State<TotalExpense> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.5,
      height: MediaQuery.of(context).size.height*0.1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF5BA66E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Total Expenditure:₹${widget.total}",
            ),
          ),
        ),
      )
    );
  }
}
