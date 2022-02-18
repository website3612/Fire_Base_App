import 'package:firebase_app/screen/cloud_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cloud_work/screen/log_screen.dart';
import 'cloud_work/screen/update_screen.dart';
import 'google/google_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleButton(),
    );
  }
}
