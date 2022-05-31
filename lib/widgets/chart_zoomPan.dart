import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartZoomPan extends StatelessWidget {
  const ChartZoomPan({
    Key? key,
    required this.zoomPan,
  }) : super(key: key);

  final ZoomPanBehavior zoomPan;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    zoomPan.zoomIn();
                  },
                ),
              ),
              Tooltip(
                message: 'Zoom Out',
                child: IconButton(
                  icon: const Icon(Icons.remove, color: Colors.amber),
                  onPressed: () {
                    zoomPan.zoomOut();
                  },
                ),
              ),
              Tooltip(
                message: 'Pan Up',
                child: IconButton(
                  icon:
                      const Icon(Icons.keyboard_arrow_up, color: Colors.amber),
                  onPressed: () {
                    zoomPan.panToDirection('top');
                  },
                ),
              ),
              Tooltip(
                message: 'Pan Down',
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.amber),
                  onPressed: () {
                    zoomPan.panToDirection('bottom');
                  },
                ),
              ),
              Tooltip(
                message: 'Pan Left',
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left,
                      color: Colors.amber),
                  onPressed: () {
                    zoomPan.panToDirection('left');
                  },
                ),
              ),
              Tooltip(
                message: 'Pan Right',
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right,
                      color: Colors.amber),
                  onPressed: () {
                    zoomPan.panToDirection('right');
                  },
                ),
              ),
              Tooltip(
                message: 'Reset',
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.amber),
                  onPressed: () {
                    zoomPan.reset();
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              // await HttpService.check(context);
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
    );
  }
}
