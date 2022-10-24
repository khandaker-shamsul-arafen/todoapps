import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Details.dart';

class home extends StatefulWidget {


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: Text('Todo Apps'),
        ),

          body: Container(
            color: Colors.white70,
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
