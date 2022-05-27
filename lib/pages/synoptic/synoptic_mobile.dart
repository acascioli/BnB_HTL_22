import 'package:flutter/material.dart';

import '../../widgets/lights.dart';
import '../../widgets/synoptic_card.dart';

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
                    name: 'Ind',
                    values: [
                      'PID_Regulator_3_PreHeater2.sStartRegualtion',
                      'PID_Regulator_3_PreHeater2.sActTemperature',
                      'PID_Regulator_3_PreHeater2.sControlPowerOut',
                      '',
                      'PID_Regulator_3_PreHeater2.sAuxStepSetpoint',
                    ],
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
                    values: [
                      'PID_Regulator_1_PFR.sStartRegualtion',
                      'PID_Regulator_1_PFR.sActTemperature',
                      'PID_Regulator_1_PFR.sControlPowerOut',
                      '',
                      'PID_Regulator_1_PFR.sAuxStepSetpoint',
                    ],
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
                    values: [
                      'OutletCoolingWaterTempMonitor.sActTemperature',
                      'InletCoolingWaterTempMonitor.sActTemperature',
                      'InjectedFluidTemperatureMonitor.sActTemperature',
                      'SafetyValveTempMonitor.sActTemperature',
                    ],
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
                    values: ['', '', '', '', '', ''],
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
                    values: [
                      '_ReadInputRegister1.sPressure_OUT',
                      '_ReadInputRegister1.SFlowTotal',
                      '_ReadInputRegister1.SFlowCylinderA',
                      '_ReadInputRegister1.SflowCylinderB',
                      '_ReadInputRegister1.sVolumeTotal',
                      '_ReadInputRegister1.sPressureCylinderA',
                      '_ReadInputRegister1.sPressureCylinderB',
                      '_ReadInputRegister1.sSafetyPressureA_Bar',
                      '_ReadInputRegister1.sSafetyPressureB_Bar',
                    ],
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
                    values: [
                      '',
                      'PID_Regulator_4_Pipe1.sActTemperature',
                      'ScaleInputPressure_filterIN.outValue',
                      'PID_Regulator_4_Pipe1.sControlPowerOut',
                      '',
                      'InletFilterTempMonitor.sActTemperature',
                      'PID_Regulator_4_Pipe1.sAuxStepSetpoint',
                    ],
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
                    values: [
                      '',
                      'MY_PID_PUMP_REGULATOR_V31.sActValue',
                      'MY_PID_PUMP_REGULATOR_V31.ControlValuePercent',
                      '',
                      '',
                      'BackPressureRegulatorTempMonitor.sActTemperature',
                    ],
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
