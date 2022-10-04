import 'package:assignment_2/router.dart';
import 'package:assignment_2/widgets/utilities/snackbar.dart';
import 'package:flutter/material.dart';

import '../services.dart';

class LoggedIn extends StatelessWidget {
  final String email, pwd;

  const LoggedIn({Key? key, required this.email, required this.pwd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Map<String, String> args = {
                    "oldEmail": email,
                    "oldPassword": pwd
                  };
                  Navigator.pushNamed(context, RouteManager.update,
                      arguments: args);
                },
                child: const Text("Update details")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteManager.logIn),
                child: const Text("Log Out")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () async {
                  Services services = Services(email: email, password: pwd);
                  bool result = await services.delete();
                  if (result) {
                    snackbar(context, "Account Deleted!!");
                    Navigator.pushReplacementNamed(context, RouteManager.logIn);
                  } else {
                    snackbar(context, "Invalid Credentials");
                  }
                },
                child: const Text("Delete Account")),
          ],
        ),
      ),
    );
  }
}
