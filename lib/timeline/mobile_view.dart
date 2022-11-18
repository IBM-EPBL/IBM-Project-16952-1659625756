import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ledgerfe/timeline/services/expense_data.dart';
import 'package:ledgerfe/timeline/utilities/expense_cards.dart';
import 'package:ledgerfe/timeline/utilities/representation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  PageController controller = PageController(viewportFraction: 1.0);
  List<ExpenseData> val=<ExpenseData>[ExpenseData(tag: "education",time: "Monday",remarks: "summa",amount: 25.0),ExpenseData(tag: "education",time: "Monday",remarks: "summa",amount: 25.0)];
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();
  StatefulBuilder filter(){
    return StatefulBuilder(
      builder: (context,setState){return AlertDialog(
        title: const Text("Filter by date"),
          content: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(1970,1,1),
                      maxTime: DateTime(2080,1,1),
                      onConfirm: (date){
                        setState(() {
                          from = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    "${from.year}/${from.month}/${from.day}"
                  ),
              ),
              ElevatedButton(
                  onPressed: (){
                    DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1970,1,1),
                        maxTime: DateTime(2080,1,1),
                        onConfirm: (date){
                          setState(() {
                            to = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    "${to.year}/${to.month}/${to.day}"
                  ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
               Navigator.pop(context, 'OK');
              },
              child: const Text('Submit'),
            ),
          ],
      );}
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => filter()
              ),
              icon: const Icon(
                FontAwesomeIcons.filter,
                color: Color(0xFF3e688c),
              )
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Icon(
                FontAwesomeIcons.user,
                color: Color(0xFF3e688c),
              ),
            ),
          ),
        ],
      ),
      body: RawScrollbar(
        thickness: 10,
        radius: const Radius.circular(12),
        timeToFade: const Duration(seconds: 1),
        controller: controller,
        child: PageView(
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          controller: controller,
          children: [
            const Representation(),
            ExpenseCards(expenses: val),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
