import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:tary_awesome_flutter/feature_message/message_form_manager.dart';
import 'package:tary_awesome_flutter/feature_message/message_model.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {

  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final  manager = context.use<MessageFormManager>();

        return Scaffold(
          appBar: AppBar(title: Text("message Composer"),),
          body: SingleChildScrollView(
            child: Form(
              key: key,
          child: Column(
            children: <Widget>[
              ListTile(
                title: StreamBuilder<Object>(
                      stream : manager.email$,
                      builder: (context, data){
                        return TextField(
                          onChanged: (value) => manager.inEmail.add(value),
                          // validator: (value)=> !value.contains('@') ? "email incorrect" : null ,
                          //onSaved: (val)=>  to = val,
                            decoration: InputDecoration(
                              labelText: "To",
                              prefixIcon: Icon(Icons.person),
                              errorText: data.error
                            ),
                        );
                      }, 
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                  stream: manager.subject$,
                  builder: (context, snapshot){
                    return TextField(
                      onChanged: manager.inSubject.add,
                    decoration: InputDecoration(
                      labelText: "suject",
                      prefixIcon: Icon(Icons.subject),
                      errorText: snapshot.error
                    ),
                  );

                  },
                  
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                  stream: manager.body$,
                  builder: (context, snapshot){
                    return TextField(
                      onChanged: manager.inBody.add,
                      maxLines: 9,
                      decoration: InputDecoration(
                        labelText: "body",
                        prefixIcon: Icon(Icons.mail),
                        errorText: snapshot.error

                      ),
                  );

                  },
                ),
              ),

               ListTile(
                title: StreamBuilder<Object>(
                  stream: manager.isFormVali$,
                  builder: (context, snapshot){
                    return RaisedButton(
                      child: Text("soumettre"),
                      onPressed: (){
                        if(snapshot.hasData){
                          Message message = manager.submit();
                          Navigator.pop(context, message);
                        }
                        
                      },
                    );

                  },
                )
              ),
              
            ],
          ),
        ),
      )
      
    );
  }
}
