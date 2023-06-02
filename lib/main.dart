import 'package:flutter/material.dart';
import 'package:login_first/pages/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Inicializamos el auth firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Litzy Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const  AuthPage(),
    );
  }
}
