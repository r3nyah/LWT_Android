import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';
import './Home.dart';
import './Login.dart';

class AuthService {

  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return Home();
        }else{
          return const Login();
        }
      },
    );
  }

  login() async {
    final twitterLogin = TwitterLogin(
        apiKey: '1tKyDgSto0I8lGu1G2FPr5e9y',
        apiSecretKey: '30Dp5vKieBXwyEvQI6rGcd9pDtaFp4PEBDytKqcwa7kY27QRM8',
        redirectURI: 'flutter-twitter-login://'
    );

    await twitterLogin.login().then((value) async {
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    });
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }
}