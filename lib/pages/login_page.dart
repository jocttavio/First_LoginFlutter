import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_first/components/my_button.dart';
import 'package:login_first/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Inicializamos los objetos que nos permiten escuchar lo que el usuario escribe
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Nuestra funcion que hace la validacion del correo electronico
  void signUserIn() async {
    //show loading circle
    //Es la animacion carga
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Aqui se inicia sesion y se envian los parametros (email y password)
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/images/back_login.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Litzy Store',
                        style: TextStyle(
                          color: Colors.white,
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
                    //  Welcome back, you've been missed!
                    Text(
                      "Bienvenido a Litzy Store",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 25),
                    //  email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: "Correo electronico",
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
                    //  forgot password?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(color: Colors.grey[6000]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    //  sign in button
                    MyButton(
                      onTap: signUserIn,
                      text: 'Iniciar Sesión',
                    ),

                    SizedBox(height: 50),
                    //  or continue with

                    const SizedBox(height: 20),
                    //  not a member? register now
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿No estas registrado?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Registrate Ahora!',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
