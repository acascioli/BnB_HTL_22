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
    return const TabBarView(
      children: [
        VariblesTable(
          selectedCategory: '',
        ),
        VariblesTable(
          selectedCategory: 'PUMP',
        ),
        VariblesTable(
          selectedCategory: 'PID',
        ),
        VariblesTable(
          selectedCategory: 'Temp',
        ),
        VariblesTable(
          selectedCategory: 'Machine',
        ),
      ],
    );
  }
}
