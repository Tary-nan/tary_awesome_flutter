import 'package:flutter/material.dart';
import 'package:tary_awesome_flutter/feature_message/message_manager.dart';
import 'package:tary_awesome_flutter/feature_message/message_model.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todosd_model.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:tary_awesome_flutter/screens/message_compose_screen.dart';

class FloatButton extends StatelessWidget {

  List<Message> message = [];
  @override
  Widget build(BuildContext context) {
    //final manager =  context.use<MessageManager>();

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => MessageCompose()))
            .then((val) {
              
          if (val.runtimeType.toString() == "Message") {
            Message msg = val;
            // register the message here
           // manager.addMessage(msg);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("tout va bien"),
              backgroundColor: Colors.green,
            ));
          }
        });
      },
    );
  }
}
