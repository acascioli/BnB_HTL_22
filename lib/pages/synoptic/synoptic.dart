import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:async';

import '../../utils/http_services.dart';

import '../synoptic/synoptic_desktop.dart';
import '../synoptic/synoptic_mobile.dart';

class SynopticPage extends StatefulWidget {
  static const String routeName = '/synoptic';

  const SynopticPage({Key? key}) : super(key: key);

  @override
  State<SynopticPage> createState() => _SynopticPageState();
}

class _SynopticPageState extends State<SynopticPage> {
  bool isSwitched = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => HttpService.check(context));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Stream<http.Response> getRandomNumberFact() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (_) {
      return HttpService.check(context);
    }).asyncMap((event) async => await event);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletLarge) {
          return const SynopticMobile();
        } else {
          return const SynopticDesktop();
        }
      },
    );
  }
}
