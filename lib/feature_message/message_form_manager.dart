import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:tary_awesome_flutter/feature_message/message_model.dart';
import 'package:tary_awesome_flutter/feature_message/validator.dart';


class MessageFormManager with Validation {

  BehaviorSubject<String> _email = BehaviorSubject<String>();
  // expose extremiter
  Sink<String> get inEmail => _email.sink;
  // access au flux
  Stream<String> get email$ => _email.stream.transform(validateEmail);

/// ************************
/// *****  register subject
/// 
  BehaviorSubject<String> _subject = BehaviorSubject<String>();
  // expose extremiter
  Sink<String> get inSubject => _subject.sink;
  // access au flux
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);

/// ************************
/// *****  register body

 BehaviorSubject<String> _body = BehaviorSubject<String>();
  // expose extremiter
  Sink<String> get inBody => _body.sink;
  // access au flux
  Stream<String> get body$ => _body.stream.transform(validateBody);

 /// ************************
/// *****  Make Submit

  Stream<bool> get isFormVali$ => 
                      Rx.combineLatest([email$, subject$, body$], (value) => true);

  Message submit(){
    String subject = _subject.value ; 
    String body = _body.value ; 

    return Message(title: subject, body: body);
  }

   void dispose(){
     _email.close();
     _subject.close();
     _body.close();
    
  }

}