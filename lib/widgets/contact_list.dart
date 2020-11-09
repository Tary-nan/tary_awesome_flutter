import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_model.dart';


class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;
  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context)=>
  Observer<List<Contact>>(
      stream: stream,
      builder: (BuildContext context,  contact) => builder(context, contact),
      onWaiting : (context) => LinearProgressIndicator(),);
}