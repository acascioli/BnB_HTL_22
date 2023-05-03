import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../utils/http_services.dart';
import '../utils/app_controller.dart';

import 'synoptic/synoptic.dart';
import '../pages/variables.dart';
import '../pages/alarms.dart';
import '../pages/charts.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  static final controller = Get.put(AppController());

  int _selectedIndex = 0;
  final List<Widget> _navIcons = const [
    Icon(
      Icons.home,
      size: 30,
    ),
    // Icon(Icons.schema_rounded, size: 30),
    Icon(Icons.warning, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.line_axis, size: 30),
  ];

  final List<Widget> _navPages = const [
    SynopticPage(),
    AlarmsPage(),
    VariablesPage(),
    ChartsPage(),
  ];
  final List<String> _titles = const [
    'Synoptic',
    'Alarms',
    'Variables',
    'Charts',
  ];

  final List<Tab> _tabList = const [
    Tab(
      icon: Icon(Icons.all_inclusive),
      text: 'All',
    ),
    Tab(
      icon: Icon(Icons.cyclone_outlined),
      text: 'Pump',
    ),
    Tab(
      icon: Icon(Icons.computer),
      text: 'PID',
    ),
    Tab(
      icon: Icon(Icons.thermostat),
      text: 'Temperature',
    ),
    Tab(
      icon: Icon(Icons.check_box),
      text: 'System',
    ),
  ];

  final List<Tab> _tabListSm = const [
    Tab(
      icon: Icon(Icons.all_inclusive),
      text: 'All',
    ),
    Tab(
      icon: Icon(Icons.cyclone_outlined),
      text: 'Pump',
    ),
    Tab(
      icon: Icon(Icons.computer),
      text: 'PID',
    ),
    Tab(
      icon: Icon(Icons.thermostat),
      text: 'Temp',
    ),
    Tab(
      icon: Icon(Icons.check_box),
      text: 'Sys',
    ),
  ];

  Timer? timer;
  late TextEditingController _controller;

  @override
  void initState() {
    // HttpService.connect(context);
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => HttpService.check(context));

    super.initState();
    _controller = TextEditingController(text: 'http://10.11.104.16:5000/');
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please check the IP address'),
            content:
                // const Text('Provide the IP address to connect to the backend.'),
                TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'http://10.11.104.16:5000/',
              ),
            ),
            actions: <Widget>[
              // TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: Theme.of(context).textTheme.labelLarge,
              //   ),
              //   child: const Text('Disable'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Enable'),
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.updateIP(_controller.text);
                  HttpService.connect(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _body = _navPages[index];
      _title = _titles[index];
    });
  }

  Widget _body = const SynopticPage();
  String _title = 'Synoptic';
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletLarge) {
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
                bottom: _selectedIndex == 2
                    ? TabBar(
                        tabs: [..._tabListSm],
                      )
                    : null,
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
                    icon: Theme.of(context).brightness == Brightness.dark
                        ? const Icon(Icons.dark_mode_outlined)
                        : const Icon(Icons.sunny),
                  )
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: _selectedIndex,
                height: 60.0,
                items: _navIcons,
                color: Theme.of(context).appBarTheme.backgroundColor!,
                // buttonBackgroundColor: Theme.of(context).backgroundColor,
                // backgroundColor: Theme.of(context).backgroundColor,
                backgroundColor: Theme.of(context).backgroundColor,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
                onTap: _onItemTapped,
                letIndexChange: (index) => true,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              body: _body,
            ),
          );
        } else {
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                bottom: _selectedIndex == 2
                    ? TabBar(
                        tabs: [..._tabList],
                      )
                    : null,
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
                    icon: Theme.of(context).brightness == Brightness.dark
                        ? const Icon(Icons.dark_mode_outlined)
                        : const Icon(Icons.sunny),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: _navIcons[0],
                    label: _titles[0],
                  ),
                  BottomNavigationBarItem(
                    icon: _navIcons[1],
                    label: _titles[1],
                  ),
                  BottomNavigationBarItem(
                    icon: _navIcons[2],
                    label: _titles[2],
                  ),
                  BottomNavigationBarItem(
                    icon: _navIcons[3],
                    label: _titles[3],
                  ),
                ],
                currentIndex: _selectedIndex,
                unselectedItemColor: Theme.of(context).iconTheme.color,
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: Theme.of(context).backgroundColor,
                selectedItemColor: Colors.green,
                onTap: _onItemTapped,
              ),
              body: _body,
            ),
          );
        }
      },
    );
  }
}
