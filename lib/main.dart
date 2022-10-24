import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:log_in_page/Details.dart';
import 'package:log_in_page/Home.dart';

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


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Apps',

      home:  home(),

    );
  }
}
