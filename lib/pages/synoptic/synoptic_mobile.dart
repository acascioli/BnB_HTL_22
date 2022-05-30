import 'package:flutter/material.dart';

import '../../widgets/lights.dart';
import '../../widgets/synoptic_card.dart';

import '../../models/nodes.dart';

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
                children: [
                  const SynopticCard(
                    name: 'Top',
                    values: [
                      'MachineMng1.sEnableMainContact',
                      'MachineMng1.sStartAirValveV2_scaricoCondensatore',
                      'MachineMng1.sStartHeater',
                      'MachineMng1.sStartPump',
                      'MachineMng1.sStartValveFlowCompensation'
                    ],
                    titles: ['Power', 'Air Valve V2', 'Heaters', 'Pump', 'BPR'],
                    widgetTypes: [0, 0, 0, 0, 0],
                  ),
                  SynopticCard(
                    name: 'Pmp',
                    values: Nodes['Pmp_1']['values'],
                    titles: Nodes['Pmp_1']['titles'],
                    widgetTypes: Nodes['Pmp_1']['widgetTypes'],
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
                    values: Nodes['Pmp_2']['values'],
                    titles: Nodes['Pmp_2']['titles'],
                    widgetTypes: Nodes['Pmp_2']['widgetTypes'],
                  ),
                  SynopticCard(
                    name: 'Ind',
                    values: Nodes['Ind']['values'],
                    titles: Nodes['Ind']['titles'],
                    widgetTypes: Nodes['Ind']['widgetTypes'],
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
                ]),
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
                  SynopticCard(
                    name: 'BPR',
                    values: Nodes['BPR']['values'],
                    titles: Nodes['BPR']['titles'],
                    widgetTypes: Nodes['BPR']['widgetTypes'],
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
                  name: 'O.H.',
                  values: Nodes['O.H.']['values'],
                  titles: Nodes['O.H.']['titles'],
                  widgetTypes: Nodes['O.H.']['widgetTypes'],
                ),
                SynopticCard(
                  name: 'SEP',
                  values: Nodes['SEP']['values'],
                  titles: Nodes['SEP']['titles'],
                  widgetTypes: Nodes['SEP']['widgetTypes'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
