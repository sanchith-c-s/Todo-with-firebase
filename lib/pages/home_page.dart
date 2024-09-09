import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/todo.dart';
import 'package:demo/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(onPressed: _displayTextInputDialog, 
      backgroundColor: Colors.blue,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),

      ),
    );
  }

  PreferredSizeWidget _appBar(){
    return AppBar(
      backgroundColor: Colors.red[400],
      title: Text(
        "Todo",
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }

  Widget _buildUI(){
    return SafeArea(child: Column(
      children: [
        _messagesListView(),
      ],
    ));
  }

  Widget _messagesListView(){
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(stream: _databaseService.getTodos(),
       builder: (context, snapshot){
        List todos = snapshot.data?.docs ?? [];
        if(todos.isEmpty){
          return const Center(
            child: Text("Add a todo!"),
          );
        }
        
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
            Todo todo = todos[index].data();
            String todoId = todos[index].id;
            // print(todoId); 
          return Padding(padding:  EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10
          ),
          child: ListTile(
            tileColor: Colors.blue[100],
            title: Text(todo.task),
            subtitle: Text(DateFormat("dd-MM-yyyy hh:mm a").format(todo.updatedOn.toDate(),),),
            trailing: Checkbox(value: todo.isDone,
             onChanged: (value){
              Todo updatedTodo = todo.copyWith(isDone: !todo.isDone, updatedOn: Timestamp.now());
              _databaseService.updateTodo(todoId, updatedTodo);
             }),
             onLongPress: (){
              _databaseService.deleteTodo(todoId);
             },
          ),
          );
        });
       }
       ),
    );
  }

  void _displayTextInputDialog()async{
    return showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        title: Text('Add a todo'),
        content: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: "Todo......"
          ),
        ),
      
        actions: <Widget>[
          
          MaterialButton(color: Colors.orange,
          child: Text('ok'),
            onPressed: (){
              Todo todo = Todo(task: _textEditingController.text,
               isDone: false, 
               createdOn: Timestamp.now(), 
               updatedOn: Timestamp.now(),);
              _databaseService.addTodo(todo);
              Navigator.pop(context);
              _textEditingController.clear();
          })
        ],
      );
    });
  }
}