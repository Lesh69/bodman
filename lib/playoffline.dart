import 'package:bodman/components/background.dart';
import 'package:bodman/responsive.dart';
import 'package:flutter/material.dart';
import 'package:bodman/game component/paper.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Row(
        children: [Paper()],
      ),
    ));
  }
}
