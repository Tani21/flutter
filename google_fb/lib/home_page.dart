import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fb/Logged_In.dart';
import 'package:google_fb/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator());
        }

        else if(snapshot.hasData)
        {
          return HomePage();
        }

        else if(snapshot.hasError)
        {
          return Center(child: Text('Something went wrong'),);
        }

        

        else 
        {
          return Text('dikkat h kuch to');
        }
      }
    );
  }
}