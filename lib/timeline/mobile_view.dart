import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerfe/timeline/utilities/expense_cards.dart';
import 'package:ledgerfe/timeline/utilities/representation.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  PageController controller = PageController(viewportFraction: 1.0);
  List<Widget> _widgetList=[
    //Representation(),
    ExpenseCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.circle,
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
