import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_controller.dart';

class LightsWidget extends StatefulWidget {
  const LightsWidget({
    Key? key,
    required this.ismobile,
  }) : super(key: key);

  final bool ismobile;

  @override
  State<LightsWidget> createState() => _LightsWidgetState();
}

class _LightsWidgetState extends State<LightsWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    late Map<String, dynamic> varsMap = controller.varsMap;
    bool _icConnected = false;

    double scaleFactorH = widget.ismobile ? 0.06 : 0.06;
    double scaleFactorW = widget.ismobile ? 0.15 : 0.06;
    return GetBuilder<AppController>(
      init: controller,
      builder: (logic) {
        _icConnected = controller.isConnected;
        varsMap = controller.varsMap;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * scaleFactorH,
              width: MediaQuery.of(context).size.width * scaleFactorW,
              child: Card(
                // color: Colors.green,
                color: (varsMap['MachineMng1.cLightGREENVisu'] == 1)
                    ? Colors.green
                    : Theme.of(context).backgroundColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * scaleFactorH,
              width: MediaQuery.of(context).size.width * scaleFactorW,
              child: Card(
                color: (varsMap['MachineMng1.cLightYELLOWVisu'] == 1)
                    ? Colors.amber
                    : Theme.of(context).backgroundColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * scaleFactorH,
              width: MediaQuery.of(context).size.width * scaleFactorW,
              child: Card(
                color: (varsMap['MachineMng1.cLightREDVisu'] == 1)
                    ? Colors.red
                    : Theme.of(context).backgroundColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * scaleFactorH,
              width: MediaQuery.of(context).size.width * scaleFactorW,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * scaleFactorH,
              width: MediaQuery.of(context).size.width * scaleFactorW,
              child: Tooltip(
                message: _icConnected ? 'Connection to PLC' : 'Connecting...',
                child: Card(
                  // color: Theme.of(context).backgroundColor,
                  color: _icConnected ? Colors.green : Colors.amber,
                  child: const Icon(
                    Icons.connected_tv,
                    // Icons.campaign_sharp,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
