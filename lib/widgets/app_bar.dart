
import 'package:flutter/material.dart';
import 'package:tary_awesome_flutter/screens/calendar_screen.dart';
import 'package:tary_awesome_flutter/screens/contact_screen.dart';
import 'package:tary_awesome_flutter/screens/inbox_screen.dart';

class AppBarr extends StatefulWidget {
  @override
  _AppBarrState createState() => _AppBarrState();
}

class _AppBarrState extends State<AppBarr> {
  int _selectItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactScreen(),
        CalendarScreen()

      ].elementAt(_selectItem),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green,
        selectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            title: Text("inbox"), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("contact"), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("calendrier"), 
          ),
        ],
        currentIndex: _selectItem,
        onTap: (value){
          setState(() {
           _selectItem = value; 
          });
        }
      ),
      
    );
  }
}