import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todos_model.dart';
import 'package:sprinkle/SprinkleExtension.dart';


class HomePage extends StatelessWidget {
  final String status;

  const HomePage({Key key, this.status}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
   final manager = context.use<WebResourceManager<Todos>>();
    manager.inFilter.add("");
    // manager.brows(status: status) ;

    return Observer(
      stream: manager.collection$,
      onWaiting: (context)=> Center(child: CircularProgressIndicator()),
      builder: (context, List<Todos> data){
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (context, i)=> Divider(),
          itemBuilder: (context, i){
            Todos _msg = data[i];
            return ListTile(
              leading: CircleAvatar(child: Text(_msg.id.toString()),),
              title: Text(_msg.title),
              subtitle: Text(_msg.title),
            );
          },
        );

      },
    );
  }
}

         