import 'package:flutter/material.dart';
import 'package:ledgerfe/login/mobile_view.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
              child: MobileView()
          ),
        ],
      ),
    );
  }
}
