import 'package:chatting_app/firebase_test/storage_view.dart';
import 'package:chatting_app/views/ask%20doctor/ask_doctor.dart';
import 'package:chatting_app/views/chat_view.dart';
import 'package:chatting_app/views/register_view.dart';
import 'package:chatting_app/views/sign_in_view.dart';
import 'package:chatting_app/views/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const WelcomeScreen(),

        // initialRoute: 'ask_doctor',
        /// _auth.currentUser !=null?'chat_view':'welcome_view',
        routes: {
          'ask_doctor': (context) => const AskDoctor(),
          'welcome_view': (context) => const WelcomeScreen(),
          'register_view': (context) => const RegistrationScreen(),
          SignInScreen.screenRoute: (context) => const SignInScreen(),
          'chat_view': (context) => const ChatScreen(),
        });
  }
}
