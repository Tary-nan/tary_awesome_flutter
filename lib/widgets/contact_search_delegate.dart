import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_manager.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_model.dart';
import 'package:tary_awesome_flutter/widgets/contact_list.dart';


class ContactSearchDelegate extends SearchDelegate {
  
  final ContactManager manager;
  ContactSearchDelegate({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = '';
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
           close(context, null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {



    if(query.length < 3){
      return Center(child: Text("your query must contains three letters"),);
    }
    
    final managers = context.use<ContactManager>();
    // j expose une extremiter de mon tuyo puis j'insere mes donner a l interieur
    managers.inFilter.add(query);

    return ContactListBuilder(
        stream: manager.browser$,
        // stream: manager.ContactFilter(query: query),
        builder: (context, contact){
          return ListView.separated(
            itemBuilder: (context, index){
              Contact _contact = contact[index];
              return ListTile(
                leading: CircleAvatar(),
                title: Text(_contact.name),
                subtitle: Text(_contact.email),
              );
            } ,
            itemCount: contact?.length ?? 0,
            separatorBuilder: (context, index) => Divider(),
          );
        }
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  final managers = context.use<ContactManager>();
   managers.inFilter.add(query);
    return ContactListBuilder(
        stream: manager.browser$,
        builder: (context, contact){
          return ListView.separated(
            itemBuilder: (context, index){
              Contact _contact = contact[index];
              return ListTile(
                leading: CircleAvatar(),
                title: Text(_contact.name),
                subtitle: Text(_contact.email),
              );
            } ,
            itemCount: contact?.length ?? 0,
            separatorBuilder: (context, index) => Divider(),
          );
        }
      );
  
}}