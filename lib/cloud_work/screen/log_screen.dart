import 'package:firebase_app/cloud_work/screen/update_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("log"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                color: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "empty";
                  }
                  if (!value.contains("@")) {
                    return "@.com";
                  }
                },
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateScreen(),
                        ));
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    _auth.signInWithEmailAndPassword(
                        email: _email.text, password: _password.text);
                  }
                },
                child: Text("log in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
