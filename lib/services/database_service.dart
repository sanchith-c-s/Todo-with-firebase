import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/todo.dart'; 
import 'package:firebase_auth/firebase_auth.dart';

const String TODO_COLLECTION_REF = "todos";

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference<Todo> _todosRef;

  DatabaseService() {
    _todosRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Todo>(
      fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!), 
      toFirestore: (todo, _) => todo.toJson(), 
    );
  }

  Stream<QuerySnapshot> getTodos(){
    return _todosRef.snapshots();
  }

  void addTodo(Todo todo) async{
    _todosRef.add(todo);
  }

  void updateTodo(String todoId, Todo todo){
    _todosRef.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId){
    _todosRef.doc(todoId).delete();
  }
}
