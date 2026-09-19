import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:message_app/screens/chat_screen.dart';
import 'package:message_app/screens/registration_screen.dart';
import 'package:message_app/screens/signin_screen.dart';
import 'package:message_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen.screenRoute
          : ChatScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
        SigninScreen.screenRoute: (context) => SigninScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      },
    );
  }
}
