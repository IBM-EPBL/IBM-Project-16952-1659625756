import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/logos/png/logo-color.png'),
        radius: MediaQuery.of(context).size.width*0.15,
      ),
    );
  }
}
