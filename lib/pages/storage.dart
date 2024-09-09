import 'dart:io';

import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firebase Storage"
        ),
        centerTitle: true,
      ),
      body: _buildUI(),
      floatingActionButton: _uploadMediaButton(context),
    );
  }

  Widget _uploadMediaButton(BuildContext context){
    return FloatingActionButton(onPressed: () async{
      File? selectedImage = await getImageFromGallery(context);
      print(selectedImage);
    },
    child: Icon(Icons.upload),
    );
  }

  Widget _buildUI(){
    return Container();
  }
}