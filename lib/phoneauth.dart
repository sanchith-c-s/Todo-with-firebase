
import 'package:demo/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phoneauth extends StatefulWidget {
  const Phoneauth({super.key});

  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                )
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: ()async{
            await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential){}, 
            verificationFailed: (FirebaseAuthException ex){},
             codeSent: (String verificationid,int? resendtoken){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Otpscreen(verificationid: verificationid,)));
             },
              codeAutoRetrievalTimeout: (String verificationId){},
              phoneNumber:phoneController.text.toString() );
          }, child: Text("Verify phone number"))
        ],
      ),
    );
  }
}