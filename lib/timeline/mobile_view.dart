import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<Widget> _widgetList=[
    Representation(),
    ExpenseCards(),
  ];
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();
  AlertDialog filter(){
    return AlertDialog(
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
                    onChanged: (date){
                      from = date;
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
                        to = date;
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
              icon: Icon(
                FontAwesomeIcons.filter,
                color: Color(0xFF3e688c),
              )
          ),
          InkWell(
            onTap: () {},
            child: Padding(
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
        radius: Radius.circular(12),
        timeToFade: Duration(seconds: 1),
        controller: controller,
        child: PageView(
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          controller: controller,
          children: _widgetList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
