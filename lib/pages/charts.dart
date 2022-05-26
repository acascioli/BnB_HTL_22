import 'package:flutter/material.dart';

import '../widgets/livechart.dart';
import '../widgets/floatingbutton.dart';
import '../widgets/variables_table.dart';

class ChartsPage extends StatefulWidget {
  static const String routeName = '/charts';

  const ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        primary: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Charts',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 713,
              // height: MediaQuery.of(context).size.height,
              child: const LiveChart(),
            ),
            const VariblesTable(),
          ],
        ),
      ),
    );
  }
}
