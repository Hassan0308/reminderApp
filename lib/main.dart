
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ReminderApp());
}


class ReminderApp extends StatefulWidget {
  @override
  _ReminderAppState createState() => _ReminderAppState();
}

class _ReminderAppState extends State<ReminderApp> {
  List<String> _reminders=[];
  TextEditingController _textController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reminder App'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _reminders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_reminders[index]),
                    );
                  },
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'Add Reminder',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addReminder();
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
  void _addReminder() {
    setState(() {
      _reminders.add(_textController.text);
      _textController.clear();
    });
  }

}

