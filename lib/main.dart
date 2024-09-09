import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/databaseOption.dart';
import 'package:demo/email_auth.dart';
import 'package:demo/nav.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/storage.dart';
import 'package:demo/phoneauth.dart';
import 'package:demo/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //  options: DefaultFirebaseOptions.currentPlatform,
  );
  await signInUserAnon();
  FirebaseFirestore.instance.settings= const Settings(
    persistenceEnabled: true
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home:HomePage(),
      // home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
      //   if(snapshot.hasData){
      //     return Databaseoption();

      //   }else{
      //     return EmailAuth();
      //   }
      // })
    );
  }
}

