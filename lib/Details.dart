import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Details extends StatefulWidget {
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController _controller = TextEditingController();
  final TextEditingController _updatecontroller = TextEditingController( );

  Box? todoBox; //Box type
  @override
  void initState() {
    // TODO: implement initState
    todoBox = Hive.box('users-name');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "write a new todo"),
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () async {
                      final _userInput = _controller.text;
                      await todoBox!.add(_userInput);
                    },
                    child: Text("Add a new todo"),
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.amber,
                  child: ValueListenableBuilder(
                      valueListenable: Hive.box('users-name').listenable(),
                      builder: (_, box, widget) {
                        return ListView.builder(
                            itemCount: todoBox!.keys.toList().length,
                            itemBuilder: (_, index) {
                              return Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text(
                                    todoBox!.getAt(index).toString(),
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return AlertDialog(
                                                      title:
                                                          Text("Update a todo"),
                                                      content: Column(
                                                        children: [
                                                          TextField(


                                                            controller:
                                                                _updatecontroller,
                                                            decoration:
                                                                InputDecoration(
                                                                    hintText:
                                                                        "${ todoBox!.getAt(index).toString()}"),

                                                          ),
                                                          SizedBox(
                                                            width: 400,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                final _userInput =
                                                                    _updatecontroller
                                                                        .text;
                                                                await todoBox!.putAt(index,
                                                                    _userInput);
                                                                Navigator.pop(context);
                                                              },
                                                              child: Text(
                                                                  "update"),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon: Icon(Icons.edit_outlined)),
                                        IconButton(
                                            onPressed: () async{
                                              await todoBox!.deleteAt(index);
                                            },
                                            icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                ))
              ],
            )),
      ),
    );
  }
}
