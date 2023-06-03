import 'package:chat_app/Pages/Register_Sarean.dart';
import 'package:chat_app/Pages/login_screan.dart';
import 'package:chat_app/Pages/ChatPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id:(context) => LoginScreen(),
        ChatPage.id:(context) => ChatPage(),
        RegisterPage.id:(context) =>RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
     initialRoute: LoginScreen.id,
    );
  }
}
