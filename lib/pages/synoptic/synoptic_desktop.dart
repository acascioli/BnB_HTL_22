import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/lights.dart';
import '../../widgets/synoptic_card.dart';
import '../../widgets/switches_card.dart';

import '../../models/nodes.dart';

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
                const SwitchesCard(
                  titles: ['Power', 'Air Valve V2', 'Heaters', 'Pump', 'BPR'],
                  variables: [
                    'MachineMng1.sEnableMainContact',
                    'MachineMng1.sStartAirValveV2_scaricoCondensatore',
                    'MachineMng1.sStartHeater',
                    'MachineMng1.sStartPump',
                    'MachineMng1.sStartValveFlowCompensation'
                  ],
                ),
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
                      children: [
                        SynopticCard(
                          name: 'Ind',
                          values: Nodes['Ind']['values'],
                          titles: Nodes['Ind']['titles'],
                          widgetTypes: Nodes['Ind']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'PFR',
                          values: Nodes['PFR']['values'],
                          titles: Nodes['PFR']['titles'],
                          widgetTypes: Nodes['PFR']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'H.E.',
                          values: Nodes['H.E.']['values'],
                          titles: Nodes['H.E.']['titles'],
                          widgetTypes: Nodes['H.E.']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'O.H.',
                          values: Nodes['O.H.']['values'],
                          titles: Nodes['O.H.']['titles'],
                          widgetTypes: Nodes['O.H.']['widgetTypes'],
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SynopticCard(
                          name: 'Pmp',
                          values: Nodes['Pmp_1']['values'],
                          titles: Nodes['Pmp_1']['titles'],
                          widgetTypes: Nodes['Pmp_1']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'Pmp',
                          values: Nodes['Pmp_2']['values'],
                          titles: Nodes['Pmp_2']['titles'],
                          widgetTypes: Nodes['Pmp_2']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'FLT',
                          values: Nodes['FLT']['values'],
                          titles: Nodes['FLT']['titles'],
                          widgetTypes: Nodes['FLT']['widgetTypes'],
                        ),
                        SynopticCard(
                          name: 'BPR',
                          values: Nodes['BPR']['values'],
                          titles: Nodes['BPR']['titles'],
                          widgetTypes: Nodes['BPR']['widgetTypes'],
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
                const SwitchesCard(
                  titles: ['Power', 'Air Valve V2', 'Heaters', 'Pump', 'BPR'],
                  variables: [
                    'MachineMng1.sEnableMainContact',
                    'MachineMng1.sStartAirValveV2_scaricoCondensatore',
                    'MachineMng1.sStartHeater',
                    'MachineMng1.sStartPump',
                    'MachineMng1.sStartValveFlowCompensation'
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SynopticCard(
                        name: 'Ind',
                        values: Nodes['Ind']['values'],
                        titles: Nodes['Ind']['titles'],
                        widgetTypes: Nodes['Ind']['widgetTypes'],
                      ),
                      SynopticCard(
                        name: 'PFR',
                        values: Nodes['PFR']['values'],
                        titles: Nodes['PFR']['titles'],
                        widgetTypes: Nodes['PFR']['widgetTypes'],
                      ),
                      SynopticCard(
                        name: 'H.E.',
                        values: Nodes['H.E.']['values'],
                        titles: Nodes['H.E.']['titles'],
                        widgetTypes: Nodes['H.E.']['widgetTypes'],
                      ),
                      SynopticCard(
                        name: 'O.H.',
                        values: Nodes['O.H.']['values'],
                        titles: Nodes['O.H.']['titles'],
                        widgetTypes: Nodes['O.H.']['widgetTypes'],
                      ),
                      SynopticCard(
                        name: 'Pmp',
                        values: Nodes['Pmp_1']['values'],
                        titles: Nodes['Pmp_1']['titles'],
                        widgetTypes: Nodes['Pmp_1']['widgetTypes'],
                      ),
                      SynopticCard(
                        name: 'Pmp',
                        values: Nodes['Pmp_2']['values'],
                        titles: Nodes['Pmp_2']['titles'],
                        widgetTypes: Nodes['Pmp_2']['widgetTypes'],
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
                      SynopticCard(
                        name: 'FLT',
                        values: Nodes['FLT']['values'],
                        titles: Nodes['FLT']['titles'],
                        widgetTypes: Nodes['FLT']['widgetTypes'],
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
                      SynopticCard(
                        name: 'BPR',
                        values: Nodes['BPR']['values'],
                        titles: Nodes['BPR']['titles'],
                        widgetTypes: Nodes['BPR']['widgetTypes'],
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
