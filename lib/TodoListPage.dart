import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  static const routeName = '/todo-list';

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late TextEditingController _textFieldController;
  late List<TodoItem> todos;
  late List<TodoItem> filteredTodos;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
    
    todos = [
      TodoItem(title: 'Example Todo 1', completed: false),
      TodoItem(title: 'Example Todo 2', completed: true),
      TodoItem(title: 'Example Todo 3', completed: false),
      TodoItem(title: 'Example Todo 4', completed: true),
      TodoItem(title: 'Example Todo 5', completed: false),
    ];
    filteredTodos = List.from(todos);
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _addTodo() {
    setState(() {
      todos.add(TodoItem(title: _textFieldController.text, completed: false));
      _textFieldController.clear();
      _search('');
    });
  }

  void _deleteTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
      _search('');
    });
  }

  void _toggleTodoAtIndex(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  void _search(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredTodos = List.from(todos);
      } else {
        filteredTodos = todos
            .where((todo) =>
            todo.title.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        hintText: 'Enter a new todo',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white, 
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.black, 
                      onPressed: _addTodo,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                onChanged: _search,
                decoration: InputDecoration(
                  hintText: 'Search todo',
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: filteredTodos[index].completed,
                        onChanged: (value) =>
                            _toggleTodoAtIndex(todos.indexOf(filteredTodos[index])),
                      ),
                      title: Text(
                        filteredTodos[index].title,
                        style: TextStyle(
                          decoration: filteredTodos[index].completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () =>
                            _deleteTodoAtIndex(todos.indexOf(filteredTodos[index])),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black, 
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.delete, color: Colors.white), 
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String title;
  bool completed;

  TodoItem({required this.title, required this.completed});
}
