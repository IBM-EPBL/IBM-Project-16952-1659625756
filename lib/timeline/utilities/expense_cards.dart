import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/expense_data.dart';

class ExpenseCards extends StatefulWidget {
  final List<ExpenseData> expenses;
  const ExpenseCards({Key? key, required this.expenses}) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
      child: ListView.builder(
          itemCount: widget.expenses.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Icon(
                      _cardIcons[widget.expenses[index].tag],
                    ),
                    title: Text(widget.expenses[index].tag),
                    subtitle: Text("${widget.expenses[index].remarks} - ₹${widget.expenses[index].amount} - ${widget.expenses[index].time}"),
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
          }),
    );
  }
}
