import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fb/Logged_In.dart';
import 'package:google_fb/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print("chal gaya");

          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else {
            return Text('dikkat h kuch to');
          }
        });
  }
}
