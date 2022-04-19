import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 400,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.grey[100],
                      title: Text(tarefas[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: click
                                ? Icon(
                                    Icons.favorite_border,
                                    size: 20.0,
                                    color: Colors.red[900],
                                  )
                                : Icon(
                                    Icons.favorite,
                                    size: 20.0,
                                    color: Colors.red[900],
                                  ),
                            onPressed: () {
                              setState(() {
                                click = !click;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                            onPressed: () {
                              setState(() {
                                tarefas.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tarefas.length),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            setState(() {
              tarefas.add(_textEditingController.text);
            });
          }
          _textEditingController.clear();
        },
      ),
    );
  }
}
