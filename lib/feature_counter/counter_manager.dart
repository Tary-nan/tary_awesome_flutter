
import 'package:sprinkle/Manager.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class CounterManager extends Manager {
  final counter = 0.reactive;

  void increment() => counter.value++;
  void decrement() => counter.value--;

  @override
  void dispose() {
    counter?.close();
  } 
}