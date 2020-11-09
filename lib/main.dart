import 'package:flutter/material.dart';
import 'package:sprinkle/Supervisor.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/sprinkle.dart';
import 'package:tary_awesome_flutter/bootcamp/interface1_screen.dart';
import 'package:tary_awesome_flutter/bootcamp/musique.dart';
import 'package:tary_awesome_flutter/feature_contact/contact_manager.dart';
import 'package:tary_awesome_flutter/feature_counter/counter_manager.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todos_services.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todosd_model.dart';
import 'package:tary_awesome_flutter/screens/input_screen.dart';
import 'package:tary_awesome_flutter/widgets/app_bar.dart';



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
      home: MusicBoot(),
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
      body: Center(child: Text('hello world')),
    );
  }
}