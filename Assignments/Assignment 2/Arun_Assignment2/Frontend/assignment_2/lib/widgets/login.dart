import 'package:assignment_2/widgets/utilities/snackbar.dart';
import 'package:flutter/material.dart';

import '../router.dart';
import '../services.dart';

class LogInWidget extends StatefulWidget {
  final String buttonText,errorText;
  final String? oldEmail, oldPwd,hintEmail,hintPwd;
  const LogInWidget({Key? key, required this.buttonText,required this.errorText, this.oldEmail, this.oldPwd, this.hintEmail='Email', this.hintPwd='Password'}) : super(key: key);

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  String email='',pwd='';
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.30, vertical: MediaQuery.of(context).size.height*0.10),
      child: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: widget.hintEmail,
                  ),
                  onSaved: (value)=>setState(() {
                    email=value!;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: widget.hintPwd,
                  ),
                  obscureText: true,
                  onSaved: (value)=>setState(() {
                    pwd=value!;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                ElevatedButton(
                    onPressed: () async{
                      formkey.currentState!.save();
                      Services services=Services(email: email,password: pwd);
                      late bool result;
                      if(widget.buttonText=="Login"){
                        result = await services.logIn();
                      }
                      else if(widget.buttonText=="Register"){
                        result = await services.register();
                      }
                      else{
                        Services services=Services(email: widget.oldEmail!,password: widget.oldPwd!,newEmail: email,newPassword: pwd);
                        result = await services.update();
                      }
                      if(result){
                        if(widget.buttonText=="Login"){
                          final args={'email': email, 'password':pwd};
                          if(!mounted)return;
                          Navigator.pushReplacementNamed(context, RouteManager.loggedIn,arguments: args);
                        }
                        else if(widget.buttonText=="Register"){
                          if(!mounted)return;
                          snackbar(context, "Account Registered!");
                        }
                        else{
                          if(!mounted)return;
                          snackbar(context, "Account Details Updated!!");
                        }
                      }
                      else{
                        if(!mounted)return;
                        snackbar(context, widget.errorText);
                      }
                    },
                    child:Text(widget.buttonText)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
