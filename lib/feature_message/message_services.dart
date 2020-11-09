import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:tary_awesome_flutter/feature_message/message_model.dart';

Future<String> loadMessageJson()async{
  return await rootBundle.loadString('data/message.json');
}

Future<List<Message>> loadListMessage()async{
  var content = await loadMessageJson();
  var messageDecode = json.decode(content);
  List<Message> result = new List<Message>.from(messageDecode.map((x)=> Message.fromJson(x))).toList();
  return result;
}