import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/expense_data.dart';

List<ExpenseData> expenses = [
  ExpenseData(tag: "food", remarks: "Dinner", amount: 50, time: "2022-12-17 13:33:0"),
  ExpenseData(tag: "education", remarks: "College Fees", amount: 150, time: "2022-12-16 13:33:0"),
];

class ExpenseCards extends StatefulWidget {
  const ExpenseCards({Key? key}) : super(key: key);

  @override
  State<ExpenseCards> createState() => _ExpenseCardsState();
}

class _ExpenseCardsState extends State<ExpenseCards> {
  static const Map<String, IconData> _cardIcons = {
    "food": FontAwesomeIcons.utensils,
    "transport": FontAwesomeIcons.truckPlane,
    "apparel": FontAwesomeIcons.personDress,
    "education": FontAwesomeIcons.school,
    "social_life": FontAwesomeIcons.peopleGroup,
    "culture": FontAwesomeIcons.handsPraying,
    "beauty": FontAwesomeIcons.sprayCanSparkles,
    "gift": FontAwesomeIcons.gift,
    "self_development": FontAwesomeIcons.stairs,
    "household": FontAwesomeIcons.house,
    "health": FontAwesomeIcons.notesMedical,
    "other": FontAwesomeIcons.ellipsisVertical
  };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(
                    _cardIcons[expenses[index].tag],
                  ),
                  title: Text("${expenses[index].tag}"),
                  subtitle: Text("${expenses[index].remarks} - ₹${expenses[index].amount}"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.ellipsis,
                ),
              ),
            ],
          );
        });
  }
}
