import 'package:api_with_provider/model/todo.dart';
import 'package:api_with_provider/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider API'),
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.todos.length,
            itemBuilder: (context, index) {
              final todo = value.todos[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                      color: todo.completed ? Colors.black : Colors.grey),
                ),
                leading: CircleAvatar(child: Text(todo.id.toString())),
                trailing: Text(todo.userId.toString()),
              );
            });
      }),
    );
  }
}
