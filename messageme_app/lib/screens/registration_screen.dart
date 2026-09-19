import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/screens/chat_screen.dart';
import 'package:message_app/widget/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Register',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2e386b),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: Image.asset('images/logo.png'),
                    ),
                    SizedBox(height: 50),
                    bulidTextField(
                      'Enter your email',
                      (value) => email = value,
                      false,
                    ),
                    SizedBox(height: 8),
                    bulidTextField(
                      'Enter your password',
                      (value) => password = value,
                      true,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        color: Color(0xff2e386b),
                        title: 'Register',
                        onpressed: () async {
                          try {
                            _isLoading = true;
                            setState(() {});
                            final newUser = await _auth
                                .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                            if (!mounted) return;
                            Navigator.pushReplacementNamed(
                              context,
                              ChatScreen.screenRoute,
                            );
                            _isLoading = false;
                            setState(() {});
                          } catch (e) {
                            _isLoading = false;
                            setState(() {});
                            print(e);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField bulidTextField(
    String hintText,
    Function(String) onChanged,
    bool isPassword,
  ) {
    var textField = TextField(
      obscureText: isPassword,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
    return textField;
  }
}
