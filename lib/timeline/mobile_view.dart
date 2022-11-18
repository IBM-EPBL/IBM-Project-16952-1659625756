import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ledgerfe/timeline/services/expense_data.dart';
import 'package:ledgerfe/timeline/services/history_http_call.dart';
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
  late Future<Map<String,dynamic>> params;
  Future<Map<String,dynamic>> getParams(int x,int y)
  {
    var service=GetHistory(from: x, to: y);
    return service.history();
  }
  @override
  void initState()
  {
    params=getParams((from.toUtc().millisecondsSinceEpoch/1e3).round(), (to.toUtc().millisecondsSinceEpoch/1e3).round());
    super.initState();
  }
  List<ExpenseData> val=<ExpenseData>[ExpenseData(tag: "education",time: "Monday",remarks: "summa",amount: 25.0),ExpenseData(tag: "education",time: "Monday",remarks: "summa",amount: 25.0)];
  DateTime to = DateTime.now();
  DateTime from = DateTime.now().subtract(const Duration(days: 30));
  void updateParams(DateTime from, DateTime to)
  {
    setState(() {params=getParams((from.toUtc().millisecondsSinceEpoch/1e3).round(), (to.toUtc().millisecondsSinceEpoch/1e3).round());});
  }
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
                      "${from.year}/${from.month}/${from.day} ${from.hour}:${from.minute}:${from.second}"
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
                    "${to.year}/${to.month}/${to.day} ${to.hour}:${to.minute}:${to.second}"
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
                updateParams(from, to);
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
      body: FutureBuilder<Map<String,dynamic>?>(
        future: params,
        builder: (context,snapshot){
          if(snapshot.hasError)
            {
              return Container();
            }
          else if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator());
            }
          else if(snapshot.hasData){
            var data=snapshot.data!;
            print(data);
            return RawScrollbar(
              thickness: 10,
              radius: const Radius.circular(12),
              timeToFade: const Duration(seconds: 1),
              controller: controller,
              child: PageView(
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                controller: controller,
                children: [
                  Representation(fetchedData: data["pieData"], total: data["total"],),
                  ExpenseCards(expenses: data["expenseData"]),
                ],
              ),
            );
          }
          else{print("hi");}
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: ()=>showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Enter Expense Details'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(),
                const TextField(),
                const TextField(),
                const TextField(),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
