import 'package:eventomatic/data/demo_data.dart';
import 'package:eventomatic/models/event.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {

  final List<Event> myEvents = events
      .where((e) => e.volunteers
      .map((v) => v.id)
      .toList()
      .contains(loggedInUser.id))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:
        myEvents.map((e) => ListTile(
                  title: Text(e.title),
                ))
            .toList(),
      ),
    );
  }
}
