import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/http_services.dart';

import 'dart:async';

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  late ChartSeriesController _chartSeriesController1;
  late ChartSeriesController _chartSeriesController2;
  late ChartSeriesController _chartSeriesController3;
  late ZoomPanBehavior _zoomPan;
  final double _iconWidth = 100;

  @override
  void initState() {
    chartData = [LiveData(0, 0, 0, 0)];
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
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
        Card(
          color: Theme.of(context).cardColor,
          child: SizedBox(
            height: 600,
            child: SfCartesianChart(
              legend: Legend(isVisible: true, isResponsive: true),
              enableAxisAnimation: true,
              series: _getStackedLineSeries(),
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
        Card(
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Tooltip(
                    message: 'Zoom In',
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.amber),
                      onPressed: () {
                        _zoomPan.zoomIn();
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Zoom Out',
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.amber),
                      onPressed: () {
                        _zoomPan.zoomOut();
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Pan Up',
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Colors.amber),
                      onPressed: () {
                        _zoomPan.panToDirection('top');
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Pan Down',
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.amber),
                      onPressed: () {
                        _zoomPan.panToDirection('bottom');
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Pan Left',
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          color: Colors.amber),
                      onPressed: () {
                        _zoomPan.panToDirection('left');
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Pan Right',
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.amber),
                      onPressed: () {
                        _zoomPan.panToDirection('right');
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Reset',
                    child: IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.amber),
                      onPressed: () {
                        _zoomPan.reset();
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await HttpService.check(context);
                },
                child: const Text('Recording'),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Counter: 0'),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  int time = 0;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, time + 30, time + 40, time + 50));
    // chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
    _chartSeriesController1.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
    _chartSeriesController2.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
    _chartSeriesController3.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
  }

  List<StackedLineSeries<LiveData, int>> _getStackedLineSeries() {
    return <StackedLineSeries<LiveData, int>>[
      StackedLineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: chartData,
          xValueMapper: (LiveData data, _) => data.time,
          yValueMapper: (LiveData data, _) => data.temp,
          name: 'Temp.',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController1 = controller;
          },
          dataSource: chartData,
          yAxisName: 'yAxisPressure',
          xValueMapper: (LiveData data, _) => data.time,
          yValueMapper: (LiveData data, _) => data.pressure,
          name: 'Press.',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController2 = controller;
          },
          dataSource: chartData,
          xValueMapper: (LiveData data, _) => data.time,
          yValueMapper: (LiveData data, _) => data.flow,
          name: 'Flow',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController3 = controller;
          },
          dataSource: chartData,
          yAxisName: 'yAxisFlow',
          xValueMapper: (LiveData data, _) => data.time,
          yValueMapper: (LiveData data, _) => data.flow + 10,
          name: 'Flow 1',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class LiveData {
  LiveData(this.time, this.temp, this.pressure, this.flow);
  final int time;
  final num temp;
  final num pressure;
  final num flow;
}
