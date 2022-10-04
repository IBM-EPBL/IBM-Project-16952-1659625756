import 'package:assignment_2/widgets/login.dart';
import 'package:flutter/material.dart';



class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Assignment 2",textAlign: TextAlign.center,),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
             Tab(
               text: "Login",
               icon: Icon(Icons.login_rounded),
             ),
              Tab(
                text: "Register",
                icon: Icon(Icons.app_registration_rounded)
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LogInWidget(buttonText: "Login", errorText: "Invalid Credentials"),
            LogInWidget(buttonText: "Register", errorText: "Already existing accound with the given email!")
          ],
        ),
      ),
    );
  }
}
