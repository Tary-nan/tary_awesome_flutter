import 'package:flutter/material.dart';
import 'package:tary_awesome_flutter/widgets/app_bar_drawer.dart';
import 'package:tary_awesome_flutter/widgets/button_compose.dart';
import 'package:tary_awesome_flutter/widgets/message_list.dart';


class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Color(0xff8489f0),
            
            tabs: <Widget>[
              Tab(text: "Important",),
              Tab(text:"Other"),
            ],

          ),
          title: Text('Inbox'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: ()async{},
            ),
          ],
        ),
        

        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            HomePage(status: "Important",),
            HomePage(status: "Other",),
          ],
        ),
        floatingActionButton: FloatButton(),
     ),
    );
  }
}