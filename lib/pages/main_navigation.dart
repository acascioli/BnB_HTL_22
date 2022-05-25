import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../widgets/floatingbutton.dart';
import '../pages/synoptic.dart';
import '../pages/variables.dart';
import '../pages/alarms.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _page = 0;
  Widget _body = const SynopticPage();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Widget> navIcons = const [
      Icon(Icons.schema_rounded, size: 30),
      Icon(Icons.warning, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.line_axis, size: 30),
    ];
    List<Widget> navPages = const [
      SynopticPage(),
      AlarmsPage(),
      VariablesPage(),
      SynopticPage(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: navIcons,
        color: Colors.green,
        // buttonBackgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _body = navPages[index];
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _body,
      floatingActionButton: const ThemeButton(),
    );
  }
}
