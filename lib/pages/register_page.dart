import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_first/components/my_button.dart';
import 'package:login_first/components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user in method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (passwordController.text != confirmPasswordController.text) {
      //  pop the loading circle
      Navigator.pop(context);
      showErrorMessage("La contraseña no coincide!");
      return;
    }
    //try sign in
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //  pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50), const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //  logo
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'lib/images/logo.png',
                      height: 140,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //  Welcome back, you've beeb missed!
                  Text(
                    "Por favor rellena los datos solicitados",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  //  email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: "Correo Electronico",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  //Password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  SizedBox(height: 10),

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirma la Contraseña',
                    obscureText: true,
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 25),
                  //  sign in button
                  MyButton(
                    onTap: signUserUp,
                    text: 'Registrarse',
                  ),

                  SizedBox(height: 50),
                  const SizedBox(height: 20),
                  //  not a member? register now
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ya tienes una cuenta?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Inicia Sesión Ahora!',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
