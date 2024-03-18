import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/screens/login.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      body: SafeArea(       
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              const Text("Home Page"),
              const SizedBox(height: 10,),
              Text("Welcome ${userEmail} !"),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Logout'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
