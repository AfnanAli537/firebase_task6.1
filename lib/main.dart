import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first_project/firebase_options.dart';
import 'package:firebase_first_project/my_app.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}
