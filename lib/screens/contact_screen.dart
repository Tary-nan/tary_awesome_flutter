import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_manager.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_model.dart';
import 'package:tary_awesome_flutter/widgets/app_bar_drawer.dart';
import 'package:tary_awesome_flutter/widgets/contact_list.dart';
import 'package:tary_awesome_flutter/widgets/contact_search_delegate.dart';


class ContactScreen extends StatelessWidget {

  // ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    ContactManager manager =  context.use<ContactManager>();
    
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("contact"),

      actions: <Widget>[
        Chip(
          label: Observer<int>(
            stream: manager.count$,
            builder: (context, data) => Text(data.toString() ?? 0 ),
            onWaiting: (context)=> CircularProgressIndicator(strokeWidth: 1,),
          ),
          labelStyle: TextStyle(color: Colors.green),
        ), 
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: ContactSearchDelegate(manager: manager));
          },
        ),
      ],
      ),

      body: new ListContact(),
    );
  }
}

class ListContact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ContactManager manager =  context.use<ContactManager>();
    manager.inFilter.add('');

    return ContactListBuilder(
    stream: manager.browser$,
    builder: (context, contact){
      return ListView.separated(
          itemBuilder: (context, index){
            Contact _contact = contact[index];
            return ListTile(
              leading: CircleAvatar(child: Text("C")),
              title: Text(_contact.name),
              subtitle: Text(_contact.email),
            );
          } ,
          itemCount: contact?.length ?? 0,
          separatorBuilder: (context, index) => Divider(),
        );
    },
    );
  }
}



         