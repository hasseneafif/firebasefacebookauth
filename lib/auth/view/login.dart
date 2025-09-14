import 'package:dainamicauth/auth/controller/facebook.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title:const Text("Login"),
      ),
      body:Column(children: [
        ElevatedButton(
  onPressed: () async {
    final user = await signInWithFacebook();
    if (user != null) {
      print("Logged in successfully: ${user.displayName}");
    } else {
      print("Facebook login failed");
    }
  },
  child: Text('Login with Facebook'),
)
      ],)
    );
  }
}
