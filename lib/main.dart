import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Src/Service.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Twitter Auth',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AuthService().handleAuthState(),
    );
  }
}

