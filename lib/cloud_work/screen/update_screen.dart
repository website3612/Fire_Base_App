import 'package:firebase_app/cloud_work/collecation/collecation_screen.dart';
import 'package:firebase_app/cloud_work/cons/cons_screen.dart';
import 'package:firebase_app/cloud_work/screen/log_screen.dart';
import 'package:firebase_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _number = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coloud'),
        leading: Icon(Icons.done),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [Colors.yellow, Colors.deepOrange])),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "Name"),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return "empty";
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
                  controller: _address,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "Address"),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 10,
                  controller: _number,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return "empty";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "mobile Number",
                      prefix: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text("+91"),
                      )),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "Password"),
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
                              builder: (context) => LogScreen(),
                            ));
                        FirebaseAuth _auth = FirebaseAuth.instance;
                        _auth.createUserWithEmailAndPassword(
                            email: _email.text, password: _password.text);

                        print(
                            'user==============>>> ${kBase.currentUser!.uid}');

                        information
                            .doc(kBase.currentUser!.uid)
                            .set({
                              "name": _name.text,
                              "email": _email.text,
                              "address": _address.text,
                              "number": _number.text,
                              "password": _password.text,
                            })
                            .then((value) => print('add success'))
                            .catchError((e) => print(e));
                      }
                    },
                    child: Text("Send"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
