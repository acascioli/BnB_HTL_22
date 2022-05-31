import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().desktopSmall + 10) {
          return const SynopticMobile();
        } else {
          return const SynopticDesktop();
        }
      },
    );
  }
}
