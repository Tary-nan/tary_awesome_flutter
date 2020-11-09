import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tary_awesome_flutter/feature_message/message_model.dart';


class MessageManager {
  BehaviorSubject<List<Message>> _msg = BehaviorSubject<List<Message>>();

  Sink<List<Message>> get inMessage => _msg.sink;
  Stream<List<Message>> get getStream$ => _msg.stream;

  List<Message> _message ;


  void addMessage(Message message){
    _message.add(message);
    inMessage.add(_message);
  }


  MessageManager(){}


  void dispose(){
    _msg.close();
  }
}