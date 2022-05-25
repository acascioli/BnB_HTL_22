import 'package:flutter/material.dart';

import '../widgets/floatingbutton.dart';
import '../widgets/synoptic_card.dart';
import '../widgets/switches_card.dart';

class SynopticPage extends StatefulWidget {
  static const String routeName = '/synoptic';

  const SynopticPage({Key? key}) : super(key: key);

  @override
  State<SynopticPage> createState() => _SynopticPageState();
}

class _SynopticPageState extends State<SynopticPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        primary: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Synoptic',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SwitchesCard(
                titles: ['Power', 'Air Valve V2', 'Heaters', 'Pump', 'BPR']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SynopticCard(
                  name: 'Ind',
                  titles: ['Start', 'Temp', 'Power out', 'Setpont', 'Auxstep'],
                  widgetTypes: [0, 1, 3, 2, 1],
                ),
                SynopticCard(
                  name: 'PFR',
                  titles: ['Start', 'Temp', 'Power out', 'Setpont', 'Auxstep'],
                  widgetTypes: [0, 1, 3, 2, 1],
                ),
                SynopticCard(
                  name: 'H.E.',
                  titles: ['Out H2O', 'In H2O', 'In Slurry', 'Safety V. T.'],
                  widgetTypes: [1, 1, 1, 1],
                ),
                SynopticCard(
                  name: 'Pump',
                  titles: [
                    'Start',
                    'Reset errors',
                    'Set safety P A',
                    'Set safety P B',
                    'Set Flow A',
                    'Set Flow B',
                    'Set Pressure',
                    'Set Pressure'
                  ],
                  widgetTypes: [0, 0, 2, 2, 2, 2, 2, 2, 2],
                ),
                SynopticCard(
                  name: 'Pump',
                  titles: [
                    'Flow A',
                    'Flow B',
                    'Total flow',
                    'Out pressure',
                    'Total Vol.',
                    'Pressure A',
                    'Pressure B'
                  ],
                  widgetTypes: [1, 1, 1, 1, 1, 1, 1, 1],
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/PnI_HTL.png',
                  width: double.infinity,
                  // height: 400,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 100,
                        child: Card(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Card(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Card(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Tooltip(
                          message: 'Alarm playing',
                          child: Card(
                            color: Theme.of(context).backgroundColor,
                            child: const Icon(
                              Icons.online_prediction,
                              // Icons.campaign_sharp,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        width: 100,
                        child: Tooltip(
                          message: 'Connection to PLC',
                          child: Card(
                            // color: Theme.of(context).backgroundColor,
                            color: Colors.green,
                            child: Icon(
                              Icons.connected_tv,
                              // Icons.campaign_sharp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const ThemeButton(),
    );
  }
}
