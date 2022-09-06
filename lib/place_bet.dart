import 'package:bodman/constants.dart';
import 'package:flutter/material.dart';

class PlaceBet extends StatefulWidget {
  const PlaceBet({Key? key}) : super(key: key);

  @override
  State<PlaceBet> createState() => _PlaceBetState();
}

class _PlaceBetState extends State<PlaceBet> {
  late final TextEditingController _bet;

  @override
  void initState() {
    _bet = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bet.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 12, 151),
        body: Center(
          child: Column(
            children: [
              Text("\n\n\n\n\n\n\n\n\n\n\n\n\n"),
              Column(children: [
                TextFormField(
                  controller: _bet,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "Enter Stake",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.numbers),
                    ),
                  ),
                ),
                Text(
                    "ODDS                                                                  1.8"),
                const SizedBox(height: defaultPadding),
                Hero(
                  tag: "login_btn",
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryLightColor, elevation: 0),
                    child: Text(
                      "PLACEBET".toUpperCase(),
                      style: TextStyle(color: Color.fromARGB(255, 10, 8, 150)),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
