import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:tary_awesome_flutter/feature_counter/counter_manager.dart';
import 'package:tary_awesome_flutter/widgets/app_bar_drawer.dart';

class CalendarScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final manager = context.use<CounterManager>();


    return Scaffold(
      appBar: AppBar(title: Text("calendar"),),
      drawer: AppDrawer(),
      body: Center(
        child: Observer<int>(
          stream: manager.counter,
          builder: (context, data)=>Text(data.toString())
      ),),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('object');
          manager.increment();
        },
      ),
    );
  }
}