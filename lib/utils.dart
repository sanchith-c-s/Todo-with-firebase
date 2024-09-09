

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

Future<void>signInUserAnon() async{
  try{
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print("Signed in with temporary account. UID: ${userCredential.user?.uid}");
  }catch(e){
    print(e);
  }
}


Future<File?> getImageFromGallery(BuildContext context) async{
  try{
    List<MediaFile>? singleMedia = await GalleryPicker.pickMedia(context: context, singleMedia: true);
    return singleMedia?.first.getFile();
  }catch(e){
    print(e);
  }
}