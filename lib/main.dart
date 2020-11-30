import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/Supervisor.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/sprinkle.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_manager.dart';
import 'package:tary_awesome_flutter/feature_counter/counter_manager.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todos_services.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todos_model.dart';


final supervisor = Supervisor()
  .register<WebResourceManager<Todos>>(() => WebResourceManager<Todos>(TodosService()))
  .register<ContactManager>(() => ContactManager())
  .register<CounterManager>(() => CounterManager());
  
  
void main()=> runApp(Sprinkle(child: MyApp(), supervisor: supervisor));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final manager = context.use<WebResourceManager<Todos>>();
    manager.inFilter.add("");
    
    return Scaffold(
      body: Observer(
        stream: manager.collection$,
        builder: (context, List<Todos> data)=> ListView.builder(
          itemBuilder: (context, index)=> ListTile(
            title: Text(data[index].title)
          ),
          itemCount: data.length,
          ),
      )
    );
  }
}