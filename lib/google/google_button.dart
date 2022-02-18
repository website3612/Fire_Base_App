import 'package:firebase_app/google/google_code.dart';
import 'package:firebase_app/google/google_home.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("google"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithGoogle();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GooglHome(),
                ));
          },
          child: Text("go to google"),
        ),
      ),
    );
  }
}
