import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import '../widgets/floatingbutton.dart';
import '../pages/synoptic.dart';
import '../pages/variables.dart';
import '../pages/alarms.dart';
import '../pages/charts.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  Widget _body = const SynopticPage();
  String _title = 'Synoptic';
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Widget> _navIcons = const [
      Icon(Icons.schema_rounded, size: 30),
      Icon(Icons.warning, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.line_axis, size: 30),
    ];
    List<Widget> _navPages = const [
      SynopticPage(),
      AlarmsPage(),
      VariablesPage(),
      ChartsPage(),
    ];
    List<String> _titles = const [
      'Synoptic',
      'Alarms',
      'Variables',
      'Charts',
    ];
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 15,
            height: 15,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/bnblab.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ),
        title: Text(_title),
        actions: [
          IconButton(
              onPressed: () {
                EasyDynamicTheme.of(context).changeTheme();
              },
              icon: const Icon(Icons.brightness_6))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: _navIcons,
        color: Theme.of(context).appBarTheme.backgroundColor!,
        // buttonBackgroundColor: Theme.of(context).backgroundColor,
        // backgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _body = _navPages[index];
            _title = _titles[index];
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _body,
    );
  }
}
