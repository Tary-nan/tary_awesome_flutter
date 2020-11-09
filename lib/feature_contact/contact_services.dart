import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:tary_awesome_flutter/feature_contact/contact_model.dart';


class ContactService {

  static String _url = 'data/contact.json';

  static loadJsonContact()async{
    return await rootBundle.loadString(_url);
  }
  static Future<List<Contact>> browser({query})async{
    var content = await loadJsonContact();
    var contactDecode = json.decode(content);
    Iterable<Contact> _contact = new List<Contact>.from(contactDecode.map((x)=> Contact.fromJson(x)));

    //await Future.delayed(Duration(seconds: 1));
    
    if(query != null && query.isNotEmpty ){
      _contact = _contact.where(
        (contact) => contact.name.toLowerCase().contains(query),);
    }
    return _contact.toList();
  }
}