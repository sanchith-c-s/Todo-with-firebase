
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PetsList extends StatefulWidget {
  const PetsList({super.key});

  @override
  State<PetsList> createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My pets'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('pets').snapshots(), 
        builder: (context,petSnapshot){
          if(petSnapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            final petDoc = petSnapshot.data!.docs;
            return ListView.builder(
              itemCount: petDoc.length,
              itemBuilder: (context,index){
              return Card(
                elevation: 10,
                child: ListTile(
                  title: Text(petDoc[index]['name']),
                  subtitle: Text(petDoc[index]['animal']),
                ),
              );
            });
          }
        }),
      ),
    );
  }
}