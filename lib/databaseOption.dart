
import 'package:demo/functions/databaseFunctions.dart';
import 'package:demo/pages/pets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Databaseoption extends StatefulWidget {
  const Databaseoption({super.key});

  @override
  State<Databaseoption> createState() => _DatabaseoptionState();
}

class _DatabaseoptionState extends State<Databaseoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Options'),
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.leave_bags_at_home))
        ], 
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                create(
                  'pets',
                  'kitty',
                  'jerry',
                  'cat',
                  5
                );
              }, child: Text("Create")),
              ElevatedButton(onPressed: (){
                update('pets', 'tom', 'age', 14);
              }, child: Text("Update")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PetsList()));
              }, child: Text("Retrieve")),
              ElevatedButton(onPressed: (){
                delete('pets', 'kitty');
              }, child: Text("Delete")),
            ],
          ),
        ),
      ),
    );
  }
}