import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../home_page_style.dart';
import 'dart:ui';
import 'task.dart';

class Body extends StatefulWidget {

  var items = new List<Task>();

  Body() {
    items = [];
    items.add(Task(title: "Run", done: false));
    items.add(Task(title: "Buy avocado", done: true));
    items.add(Task(title: "Fix TV", done: false));
    items.add(Task(title: "Write essay", done: false));
    items.add(Task(title: "Email Joe", done: false));
    items.add(Task(title: "Clean my room", done: false));
  }

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  _BodyState(){
    load();
  }

  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(Task(
        title: newTaskCtrl.text,
        done: false,
      ),
      );
      newTaskCtrl.text = "";
      save();
    });
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Task> result = decoded.map((x) => Task.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery
        .of(context)
        .size;

    return Column(

      children: <Widget>[

        //Header with add new task box
        Container(

          margin: EdgeInsets.only(bottom: 20),
          height: size.height * 0.2,
          
          child: Stack(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.only(
                  left: 28,
                  right: 28,
                  bottom: 28,
                ),
                height: size.height * 0.2 - 27,
                decoration: HomeBoxDecoration.titleBarBox,
                child: Row(

                  children: <Widget>[
                    
                    Text('My to-do list', style: HomeTextStyles.title),
                    Spacer(),
                  ],

                ),
              ),

              Positioned(
                bottom:0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: 54,
                  decoration: HomeBoxDecoration.addTaskBox,
                  
                  child: TextFormField(
                      controller: newTaskCtrl,
                      keyboardType: TextInputType.text,
                      decoration: HomeTextFormFieldDecoration.addTaskField,
                  ),
                ),
              ),

              Positioned(
                bottom:0,
                left: size.width * 0.77,
                right: 0,
                child: Container(

                  alignment: Alignment.center,
                  height: 54,

                  child: FloatingActionButton(
                    onPressed: add,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),

                ),
              ),

            ],
          ),

        ),

        //List of tasks
        Container (

            padding: EdgeInsets.only(
                top: 30,
                left: 50,
                right: 50,
                bottom: 0
            ),
            //   color: Colors.pink,
            height: 450,
            alignment: Alignment.center,
            child: ListView.builder(

                itemCount: widget.items.length,
                itemBuilder: (BuildContext ctxt, int index){
                  final item = widget.items[index];
                  return Card (

                    shape: new BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Dismissible(
                      child: Container (

                        decoration: HomeBoxDecoration.listBox,
                        child: Column(

                            children: <Widget>[

                              new CheckboxListTile(

                                dense: true,
                                title: Text(
                                  item.title,
                                  style: HomeTextStyles.itemName,
                                ),
                                value: item.done,
                                onChanged: (value) {
                                  setState(() {
                                    item.done = value;
                                    save();
                                  });
                                },
                              ),
                            ]
                        ),
                      ),
                      key: Key(item.title),
                      background: Container(
                        decoration: HomeBoxDecoration.dismissible,
                      ),
                      onDismissed: (direction) {
                        remove(index);
                      },
                    ),
                  );
                }
            )
        ),
      ],
    );

  }
}
