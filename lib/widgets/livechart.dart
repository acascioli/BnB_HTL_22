import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../models/chartData.dart';
import '../../utils/app_controller.dart';
import '../widgets/chart_zoomPan.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  late List<LiveData> chartData;
  List<LineSeries<LiveData, int>>? series;
  late List<LineSeries<LiveData, int>> chartSeries;
  final controller = Get.put(AppController());
  late Iterable<dynamic> selectedIndexes;
  late ZoomPanBehavior _zoomPan;

  Map chartControllerMap = {};
  Map chartDataMap = {};

  @override
  void initState() {
    if (controller.varsTable.isNotEmpty) {
      selectedIndexes = controller.getSelectedIndexes();
      chartData = controller.getChartData().cast();
      series = <LineSeries<LiveData, int>>[...getChartSeries()];
      Timer.periodic(const Duration(seconds: 1), updateDataSource);
    }
    _zoomPan = ZoomPanBehavior(
      enableDoubleTapZooming: true,
      enablePanning: true,
      enablePinching: true,
      enableSelectionZooming: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Card(
              elevation: 10,
              child: SfCartesianChart(
                legend: Legend(
                  isVisible: true,
                  isResponsive: true,
                ),
                enableAxisAnimation: true,
                series: series,
                axes: <ChartAxis>[
                  NumericAxis(
                    opposedPosition: true,
                    name: 'yAxisFlow',
                    majorGridLines: const MajorGridLines(width: 0),
                    labelFormat: '{value} ml/min',
                    title: AxisTitle(text: 'Flow [ml/min]'),
                  ),
                  NumericAxis(
                    opposedPosition: false,
                    name: 'yAxisPressure',
                    majorGridLines: const MajorGridLines(width: 0),
                    labelFormat: '{value} bar',
                    title: AxisTitle(text: 'Pressure [bar]'),
                  ),
                ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    // enableAutoIntervalOnZooming: true,
                    interval: 3,
                    title: AxisTitle(text: 'Time [seconds]')),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value} °C',
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  title: AxisTitle(text: 'Temp. [°C]'),
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  duration: 5,
                ),
                zoomPanBehavior: _zoomPan,
                trackballBehavior: TrackballBehavior(
                  enable: true,
                  activationMode: ActivationMode.singleTap,
                ),
              ),
            ),
          ),
        ),
        ChartZoomPan(
          zoomPan: _zoomPan,
        ),
      ],
    );
  }

  int time = 0;
  void updateDataSource(Timer timer) {
    for (var j in controller.selectedIndexes) {
      if (chartDataMap[j] != null) {
        chartDataMap[j].add(LiveData(chartDataMap[j].length,
            double.parse(controller.varsTable['Values'][j])));
        // LiveData(time++, double.parse(controller.varsTable['Values'][j])));
        // chartData.removeAt(0);
        chartControllerMap[j].updateDataSource(
          addedDataIndex: chartDataMap[j].length - 1,
          // removedDataIndex: 0,
        );
      }
    }
  }

  List<LineSeries<LiveData, int>> getChartSeries() {
    List<LineSeries<LiveData, int>> _series = [];
    for (var k in controller.selectedIndexes) {
      List<LiveData> _data = [];
      var yName;

      if (controller.varsTable['U.M.'][k.toString()] == '°C') {
        yName = null;
      } else if (controller.varsTable['U.M.'][k.toString()] == 'Bar') {
        yName = 'yAxisPressure';
      } else if (controller.varsTable['U.M.'][k.toString()] == 'ml/min') {
        yName = 'yAxisFlow';
      }

      for (int i = 0;
          i < controller.varsTable['Log'][k.toString()].length;
          ++i) {
        _data.add(LiveData(i, controller.varsTable['Log'][k.toString()][i]));
      }
      _series.add(
        LineSeries<LiveData, int>(
          key: ValueKey<String>(
              '${controller.varsTable['VISUALIZATION NAME'][k.toString()]}'),
          name: controller.varsTable['VISUALIZATION NAME'][k.toString()],
          onRendererCreated: (ChartSeriesController _chartController) {
            chartControllerMap[k.toString()] = _chartController;
          },
          yAxisName: yName,
          dataSource: _data,
          color: controller.varsTable['Color'][k.toString()],
          xValueMapper: (LiveData time, _) => time.time,
          yValueMapper: (LiveData yData, _) => yData.speed,
        ),
      );
      chartDataMap[k.toString()] = _data;
    }
    return _series;
  }

  // List<LiveData> getChartData() {
  //   List<LiveData> _data = [];
  //   for (int i = 0; i < controller.varsTable['Log']['5'].length; ++i) {
  //     // for (int i = 0; i < 20; ++i) {
  //     _data.add(LiveData(i, controller.varsTable['Log']['5'][i]));
  //   }
  //   return _data;
  // }
  // List<LiveData> getChartData() {
  //   return <LiveData>[
  //     LiveData(0, 42),
  //   ];
  // }
}
// List<LiveData> getChartData() {
//   if (controller.varsTable.isEmpty) {
//     List<LiveData> _data = [
//       LiveData(0, 42),
//       LiveData(1, 47),
//       LiveData(2, 43),
//       LiveData(3, 49),
//       LiveData(4, 54),
//       LiveData(5, 41),
//       LiveData(6, 58),
//       LiveData(7, 51),
//       LiveData(8, 98),
//       LiveData(9, 41),
//       LiveData(10, 53),
//       LiveData(11, 72),
//       LiveData(12, 86),
//       LiveData(13, 52),
//       LiveData(14, 94),
//       LiveData(15, 92),
//       LiveData(16, 86),
//       LiveData(17, 72),
//       LiveData(18, 94)
//     ];
//     return _data;
//   } else {
//     List<LiveData> _data = [];
//     // for (int i = 0; i < controller.varsTable['Log']['5'].length; ++i) {
//     for (int i = 0; i < 20; ++i) {
//       _data.add(LiveData(i, 72));
//     }
//     return _data;
//   }
// }

