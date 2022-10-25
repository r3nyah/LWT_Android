import 'package:flutter/material.dart';
import 'package:twitter_auth_flutter/Src/Service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login With Twitter',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            ElevatedButton(
              onPressed: (){
                AuthService().login();
              },
              child: const Text(
                'Login',
              ),
            ),
            /*ElevatedButton(
              onPressed: (){
                logout();
              },
              child: const Text(
                'Logout',
              ),
            ),*/
          ],
        )
      ),
    );
  }
}
