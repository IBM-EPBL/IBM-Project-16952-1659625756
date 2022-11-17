import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ledgerfe/profile/utilities/profile_items.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(
                FontAwesomeIcons.user,
                color: const Color(0xFF3e688c),
              ),
            ),
          ),
        ],
      ),
      body: ProfileItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          FontAwesomeIcons.rightFromBracket,
        ),
      ),
    );
  }
}

