import 'package:flutter/material.dart';

import 'indicators_widget.dart';
class Indication extends StatefulWidget {
  const Indication({Key? key}) : super(key: key);

  @override
  State<Indication> createState() => _IndicationState();
}

class _IndicationState extends State<Indication> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
          child: const IndicatorsWidget(),
        ),
      ],
    );
  }
}
