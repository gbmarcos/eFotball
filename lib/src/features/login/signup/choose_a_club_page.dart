import 'package:fifa/r.dart';
import 'package:flutter/material.dart';

class ChooseAClubPage extends StatefulWidget {
  const ChooseAClubPage({Key? key}) : super(key: key);

  @override
  _ChooseAClubPageState createState() => _ChooseAClubPageState();
}

class _ChooseAClubPageState extends State<ChooseAClubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.background,
      body: Center(
        child: Icon(
          Icons.construction,
          size: 40,
          color: R.colors.orange,
        ),
      ),
    );
  }
}
