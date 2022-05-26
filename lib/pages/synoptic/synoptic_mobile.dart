import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/lights.dart';
import '../../widgets/synoptic_card.dart';
import '../../widgets/switches_card.dart';

class SynopticMobile extends StatefulWidget {
  const SynopticMobile({Key? key}) : super(key: key);

  @override
  State<SynopticMobile> createState() => _SynopticMobileState();
}

class _SynopticMobileState extends State<SynopticMobile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: LightsWidget(
              ismobile: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SynopticCard(
                    name: 'Top',
                    titles: ['Power', 'Air Valve V2', 'Heaters', 'Pump', 'BPR'],
                    widgetTypes: [0, 0, 0, 0, 0],
                  ),
                  SynopticCard(
                    name: 'Ind',
                    titles: [
                      'Start',
                      'Temp',
                      'Power out',
                      'Setpont',
                      'Auxstep'
                    ],
                    widgetTypes: [0, 1, 3, 2, 1],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SynopticCard(
                    name: 'PFR',
                    titles: [
                      'Start',
                      'Temp',
                      'Power out',
                      'Setpont',
                      'Auxstep'
                    ],
                    widgetTypes: [0, 1, 3, 2, 1],
                  ),
                  SynopticCard(
                    name: 'H.E.',
                    titles: ['Out H2O', 'In H2O', 'In Slurry', 'Safety V. T.'],
                    widgetTypes: [1, 1, 1, 1],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SynopticCard(
                    name: 'Pmp',
                    titles: [
                      'Start',
                      'Set Pressure',
                      'Reset errors',
                      'Set safety P A',
                      'Set safety P B',
                      'Set Flow A',
                      'Set Flow B',
                    ],
                    widgetTypes: [0, 0, 2, 2, 2, 2, 2, 2],
                  ),
                  SynopticCard(
                    name: 'Pmp',
                    titles: [
                      'Out pressure',
                      'Total flow',
                      'Flow A',
                      'Flow B',
                      'Total Vol.',
                      'Pressure A',
                      'Pressure B',
                      'Safety P A',
                      'Safety P B'
                    ],
                    widgetTypes: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SynopticCard(
                    name: 'FLT',
                    titles: [
                      'Start',
                      'Temp',
                      'Upstream P',
                      'Power out',
                      'Setpont',
                      'In T',
                      'Auxstep'
                    ],
                    widgetTypes: [0, 1, 1, 3, 2, 1, 1],
                  ),
                  SynopticCard(
                    name: 'BPR',
                    titles: [
                      'Start',
                      'P',
                      'Opening',
                      'Setpont',
                      'Gradient',
                      'T'
                    ],
                    widgetTypes: [0, 1, 3, 2, 2, 1],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
