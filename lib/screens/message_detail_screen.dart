import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String title;
  final String body ;
  MessageDetail({this.title, this.body});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text(body),),
    );
  }
}