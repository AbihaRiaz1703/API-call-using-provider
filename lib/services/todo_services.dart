import 'dart:convert';

import 'package:api_with_provider/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoServices {
  Future<List<Todo>> getAll() async {
    final url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    if (responce.statusCode == 200) {
      final json = jsonDecode(responce.body) as List;
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return todos;
    }
    return [];
    //throw "something went wrong";
  }
}
