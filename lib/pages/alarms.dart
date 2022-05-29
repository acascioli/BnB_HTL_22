import 'package:flutter/material.dart';
import '../widgets/floatingbutton.dart';

class AlarmsPage extends StatefulWidget {
  static const String routeName = '/alarms';

  const AlarmsPage({Key? key}) : super(key: key);

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        primary: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
