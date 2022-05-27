import 'package:flutter/material.dart';

import '../widgets/variables_table.dart';

class VariablesPage extends StatefulWidget {
  static const String routeName = '/variables';

  const VariablesPage({Key? key}) : super(key: key);

  @override
  State<VariablesPage> createState() => _VariablesPageState();
}

class _VariablesPageState extends State<VariablesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        primary: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: VariblesTable(),
            )
          ],
        ),
      ),
    );
  }
}
