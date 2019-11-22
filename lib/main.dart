import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _tasks = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: taskController,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black87
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type a new task here...',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Task field it\'s required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: RaisedButton(
                        child: Text('Add', style: TextStyle(fontSize: 20),),
                        onPressed: () {
                          debugPrint('CLIQUEI!!!');
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _tasks.add(taskController.text);
                            });
                            taskController.clear();
                          }
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
