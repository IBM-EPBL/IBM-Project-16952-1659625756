import 'package:assignment_2/widgets/login.dart';
import 'package:flutter/material.dart';


class Update extends StatelessWidget {
  final String oldEmail,oldPassword;
  const Update({Key? key, required this.oldEmail, required this.oldPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment 2"),
      ),
      body: LogInWidget(buttonText: "Update",errorText: "Invalid Credentials",oldEmail: oldEmail,oldPwd: oldPassword,hintEmail: 'New Email',hintPwd: 'New Password',),
    );
  }
}
