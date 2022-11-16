import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);
  List<Widget> _widgetList=[
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
    );
  }
}
