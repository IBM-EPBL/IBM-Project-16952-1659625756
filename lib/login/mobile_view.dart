import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerfe/login/utilities/logo.dart';
import 'package:ledgerfe/login/utilities/submit_button.dart';
import 'package:ledgerfe/login/utilities/username_field.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5BA66E),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0)),
        backgroundColor: const Color(0xFF5BA66E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Logo(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            UsernameField(),
            Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.07, 0, MediaQuery.of(context).size.width*0.07, MediaQuery.of(context).size.width*0.07),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05 ,
            ),
            SubmitButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    "Don't have an account?",
                    style: GoogleFonts.kanit()
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register now",
                      style: GoogleFonts.kanit()
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
