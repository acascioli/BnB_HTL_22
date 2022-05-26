import 'package:flutter/material.dart';

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
    double scale_factor_h = widget.ismobile ? 0.06 : 0.06;
    double scale_factor_w = widget.ismobile ? 0.15 : 0.06;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * scale_factor_h,
          width: MediaQuery.of(context).size.width * scale_factor_w,
          child: const Card(
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * scale_factor_h,
          width: MediaQuery.of(context).size.width * scale_factor_w,
          child: Card(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * scale_factor_h,
          width: MediaQuery.of(context).size.width * scale_factor_w,
          child: Card(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * scale_factor_h,
          width: MediaQuery.of(context).size.width * scale_factor_w,
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
          height: MediaQuery.of(context).size.height * scale_factor_h,
          width: MediaQuery.of(context).size.width * scale_factor_w,
          child: const Tooltip(
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
    );
  }
}
