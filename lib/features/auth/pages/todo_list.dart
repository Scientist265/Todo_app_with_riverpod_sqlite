import 'package:flutter/material.dart';
import 'package:todo_app_withapi/common/routes/routes.dart';
import 'package:todo_app_withapi/services/todo_list_api.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void navigateToAddPage() {
    Navigator.pushNamed(context, todoRoute);
  }

  List items = [];
  final todoListApi = TodoListApi();
  void fetchTodo() async {
    final response = await todoListApi.fetchTodo();
    setState(() {
      items = response;
    });
  }

  @override
  void initState() {
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: const Center(child: Text('Todo List')),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(title: Text(item.toString()));
            }));
  }
}

