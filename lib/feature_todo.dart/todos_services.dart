import 'package:sprinkle/Service.dart';
import 'package:stash_dio/stash_dio.dart';
import 'package:tary_awesome_flutter/feature_todo.dart/todosd_model.dart';

import 'package:dio/dio.dart';


final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'))
    ..interceptors.addAll([
      newMemoryCacheInterceptor('/todos', 'task'),
      LogInterceptor(
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: false)
    ]);

class TodosService extends Service<Todos> {
  @override
  Future<List<Todos>> browse({String filter})async {
    Iterable<Todos> _data;

    Response<dynamic> response  = await dio.get('/todos');
    if(response.statusCode == 200){
       _data = List<Todos>.from((response.data as List).map((element) => Todos.fromJson(element)));
       if (filter.trim().isNotEmpty) { 
         _data = _data.where((element) => element.id.toString().contains(filter));
       }
    }
    return _data.toList();
  }
}