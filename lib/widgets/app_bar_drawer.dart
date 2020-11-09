import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("tary@nan.ci") ,
                accountName: Text("youssoufa"),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.add),
                  )
                ],
                currentAccountPicture: CircleAvatar(
                  child: Text("Tary"),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.inbox),
                title: Text('inbox'),
                trailing: Chip(
                  label: Text("11"),
                  backgroundColor: Colors.green.shade100,
                ),
              ),
              ListTile(
                leading: Icon(Icons.transform),
                title: Text('Trash'),
              ),
              ListTile(
                leading: Icon(Icons.drafts),
                title: Text('Draft'),
              ),
              ListTile(
                leading: Icon(Icons.archive),
                title: Text('Archives'),
              ),
              ListTile(
                leading: Icon(Icons.send),
                title: Text('Send'),
              ),

              Divider(),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
              ),
                )
              )
            ],
          ),
        );
  }
}