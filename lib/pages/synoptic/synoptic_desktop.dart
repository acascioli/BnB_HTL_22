import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/lights.dart';
import '../../widgets/synoptic_card.dart';
import '../../widgets/switches_card.dart';

class SynopticDesktop extends StatefulWidget {
  const SynopticDesktop({Key? key}) : super(key: key);

  @override
  State<SynopticDesktop> createState() => _SynopticDesktopState();
}

class _SynopticDesktopState extends State<SynopticDesktop> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < const RefinedBreakpoints().desktopSmall + 200) {
          return SingleChildScrollView(
            primary: false,
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SwitchesCard(titles: [
                  'Power',
                  'Air Valve V2',
                  'Heaters',
                  'Pump',
                  'BPR'
                ]),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightsWidget(
                    ismobile: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                          titles: [
                            'Out H2O',
                            'In H2O',
                            'In Slurry',
                            'Safety V. T.'
                          ],
                          widgetTypes: [1, 1, 1, 1],
                        ),
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
        } else {
          return SingleChildScrollView(
            primary: false,
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SwitchesCard(titles: [
                  'Power',
                  'Air Valve V2',
                  'Heaters',
                  'Pump',
                  'BPR'
                ]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                        titles: [
                          'Out H2O',
                          'In H2O',
                          'In Slurry',
                          'Safety V. T.'
                        ],
                        widgetTypes: [1, 1, 1, 1],
                      ),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SynopticCard(
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
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/PnI_HTL.png',
                            // width: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.65,
                            // height: 400,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            top: 10,
                            left: 10,
                            child: LightsWidget(
                              ismobile: false,
                            ),
                          ),
                        ],
                      ),
                      const SynopticCard(
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
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
