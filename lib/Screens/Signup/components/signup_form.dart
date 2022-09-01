// ignore_for_file: unnecessary_const

import 'dart:ffi';
import 'package:bodman/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bodman/components/terms_and_codition.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _age;
  late final TextEditingController _passwordConfirmation;
  late final TextEditingController _termsAndConditions;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _age = TextEditingController();
    _password = TextEditingController();
    _passwordConfirmation = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    onSaved: (name) {},
                    decoration: const InputDecoration(
                      hintText: "FULL NAME...",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: const Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          onSaved: (email) {},
                          decoration: InputDecoration(
                              hintText: "Email....",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: const Icon(Icons.email),
                              )))),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                          controller: _age,
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          onSaved: (age) {},
                          decoration: InputDecoration(
                              hintText: "AGE....",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: const Icon(Icons.email),
                              )))),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      controller: _password,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      controller: _passwordConfirmation,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                        hintText: "re-enter password",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  ElevatedButton(
                      onPressed: () async {
                        final name = _name.text;
                        final age = _age.text;
                        final email = _email.text;
                        final password = _password.text;
                        final passwordConfirmation = _passwordConfirmation.text;

                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryLightColor, elevation: 0),
                      child: Text(
                        "Sign Up".toUpperCase(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 8, 150)),
                      )),
                  const SizedBox(height: defaultPadding),
                  const SizedBox(height: defaultPadding),
                  Terms(),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          default:
            return const Text("loading...");
        }
      },
    );
  }
}
