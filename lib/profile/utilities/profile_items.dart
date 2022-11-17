import 'package:flutter/material.dart';

class ProfileItems extends StatefulWidget {
  const ProfileItems({Key? key}) : super(key: key);

  @override
  State<ProfileItems> createState() => _ProfileItemsState();
}

class _ProfileItemsState extends State<ProfileItems> {
  List<Widget> profileChildren=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: profileChildren,
    );
  }
}
