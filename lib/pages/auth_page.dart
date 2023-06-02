import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_first/pages/home_page.dart';
import 'package:login_first/pages/login_or_register_page.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        //  User is logged in
          if(snapshot.hasData){
            return ChangeNotifierProvider(create: (context) => Cart(),
              builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
              ),
            );

          }else{
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}



