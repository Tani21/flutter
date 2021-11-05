import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fb/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({ Key? key }) : super(key: key);

  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(title: Text('Log In'),),

      body: Column(
        children: [
          Center(
            child: Text('Profile page', style: TextStyle(color:Colors.black,),),

            
          ),
          SizedBox(height: 10,),

          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),

          SizedBox(height: 10,),

          Text('Name '+user.displayName!),

           SizedBox(height: 10,),

          Text('Name '+user.email!),


          SizedBox(height: 20,),

          TextButton(onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          }, child: Text('LogOut', style: TextStyle(color: Colors.black),))



        ],
      ),
    );

    
  }
}