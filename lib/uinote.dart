import 'package:bodman/constants.dart';
import 'package:bodman/place_bet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bodman/Screens/Signup/components/signup_form.dart';

import 'Screens/Login/login_screen.dart';

class mainui extends StatefulWidget {
  const mainui({super.key, required this.title});

  final String title;

  @override
  State<mainui> createState() => _mainuiState();
}

class _mainuiState extends State<mainui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 12, 151),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 4, 5, 4),
      ),
      body: Center(
        child: Column(
          children: [
            Text("\n\n"),
            Center(
                child: Text("GAMES PLAY NOW",
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const PlaceBet()),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryLightColor, elevation: 0),
                onHover: (Text) => Colors.black12,
                child: Text(
                  "ROCK PAPER SCISSORS".toUpperCase(),
                  style: TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 8, 12),
              ),
              child: Text('BODMAN'),
            ),
            ListTile(
              title: const Text('PLAY OFFLINE'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("deposit"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('TERMS AND CONDITION'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('CONTACT US'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('WITHDRAW FUNDS'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('LOGOUT'),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const LoginScreen()),
                    ));

                // Update the state of the app
                // ...
                await FirebaseAuth.instance.signOut();
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
