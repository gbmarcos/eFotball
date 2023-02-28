import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:flutter/material.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: UnderConstruction(),
      ),
    );
  }
}
