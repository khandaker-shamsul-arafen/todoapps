import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:log_in_page/Details.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box usersName =await Hive.openBox("users-name");
  runApp(MaterialApp(home: MyApp()));
 // Box box= await Hive.openBox("to do");

  // usersName.put('name','Afnan');
  // var name = usersName.get('name');
  //print('Name:$name');
}

class MyApp extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _controller =TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                   // controller: _controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Enter your email"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "this field cannot be empty";
                        } else if (val.length < 4) {
                          return "enter a valid email";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                    //  controller: _controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: "Enter your name"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "this field cannot be empty";
                        }
                        // else if(val.length<4){
                        //    return "enter a valid email";
                        //  }
                        else {
                          return null;
                        }
                      }),
                  TextFormField(
                     // controller: _controller,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:
                          InputDecoration(hintText: "Enter your password"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "this field cannot be empty";
                        }
                          else if(val.length<4){
                           return "enter a passwoeord atleast 4";
                          }
                        else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: () {
                    if(_formkey.currentState!.validate()){
                        Navigator.push(context, CupertinoPageRoute(builder: (_)=>Details()));
                    }
                  }, child: Text("validate  now"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
