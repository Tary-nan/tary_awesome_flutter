import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sprinkle/Manager.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_model.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_services.dart';

// var CONTACT = ['tary', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha', 'youss', 'youssoupha'];

class ContactManager extends Manager {

  // *****  first je creer mon controller qui est
  // une variable privee 
  // permet de controller notre flux
  // permet de souscrit a un abonnement 

  final BehaviorSubject<int> _controller = BehaviorSubject<int>();
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject<List<Contact>>();

  // Je souscrire une eul fois 
  // final StreamController<int> _controller = StreamController<int>(); 


  Sink<String> get inFilter => _filterSubject.sink;

  // mon getter pour recuperer mon stream
  Stream<int> get count$ => _controller.stream;

// return une liste de Stream 
// after read here he display an error 
  // Stream<List<Contact>> browser$() async*{
  //   await Future.delayed(Duration(seconds: 1));
  //   yield await ContactService.browser();
  // }

   Stream<List<Contact>> get browser$ => _collectionSubject.stream;

  // Observable<List<Contact>> ContactFilter({query}) => 
  //     Stream.fromFuture(ContactService.browser(query: query)); 

  ContactManager(){
    _filterSubject.listen((filter) async{
      var contact = await ContactService.browser(query: filter);
      _collectionSubject.add(contact);
    });
    _collectionSubject.listen((list)=> _controller.add(list.length));
  }

  void dispose(){
    _controller.close();
    _filterSubject.close();
  }
}