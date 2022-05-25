import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'package:http/http.dart' as http;

import '../utils/http_services.dart';

class SynopticCard extends StatefulWidget {
  const SynopticCard({
    Key? key,
    required this.name,
    required this.titles,
    required this.widgetTypes,
  }) : super(key: key);

  final String name;
  final List<String> titles;
  final List<int> widgetTypes;

  @override
  State<SynopticCard> createState() => _SynopticCardState();
}

class _SynopticCardState extends State<SynopticCard> {
  final Map switchesMap = {};
  late List<bool> switches = List.filled(widget.titles.length, false);

  Stream<http.Response> getRandomNumberFact() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (_) {
      return http.get(HttpService.readUrl);
    }).asyncMap((event) async => await event);
  }

  // widgetTypes 0 for switch, 1 for text, 2 for textfield, 3 progressive bar
  Widget getwidget(int index) {
    switch (widget.widgetTypes[index]) {
      case 0:
        double scaleFactor = 0.8;
        return Transform.scale(
          scale: scaleFactor,
          child: CupertinoSwitch(
            value: switches[index],
            onChanged: (value) {
              setState(() {
                switches[index] = value;
              });
            },
          ),
        );
      case 1:
        if (widget.titles[index] == 'Temp') {
          return StreamBuilder<http.Response>(
            stream: getRandomNumberFact(),
            builder: (context, snapshot) => snapshot.hasData
                ? Center(
                    child: Text(
                    snapshot.data!.body,
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
                : const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
          );
        } else {
          switchesMap['Text' + widget.titles[index]] = '0';
          return Text(
            switchesMap['Text' + widget.titles[index]],
            style: Theme.of(context).textTheme.bodyText1,
          );
        }
      case 2:
        switchesMap['TextField' + widget.titles[index]] = '0';
        return SizedBox(
          height: 25,
          width: 50,
          child: TextField(
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.end,
            decoration: const InputDecoration(
              // border: const OutlineInputBorder(),
              // labelText: switchesMap['TextField' + widget.titles[index]],
              hintText: '0',
            ),
          ),
        );
      case 3:
        switchesMap['Bar' + widget.titles[index]] = 90.0;
        return SizedBox(
          height: 30,
          width: 90,
          child: FAProgressBar(
            currentValue: switchesMap['Bar' + widget.titles[index]],
            changeColorValue: 71,
            changeProgressColor: Colors.red,
            progressColor: Colors.blue,
            displayText: '%',
          ),
        );
      default:
        return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        // height: 3 * 38,
        // height: widget.titles.length * 38,
        width: 180,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          // the number of items in the list
          itemCount: 3,
          // itemCount: widget.titles.length,

          // display each item of the product list
          itemBuilder: (context, index) {
            return index != 2
                ? Card(
                    // In many cases, the key isn't mandatory
                    key: UniqueKey(),
                    child: SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.titles[index],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            getwidget(index),
                          ],
                        ),
                      ),
                    ),
                  )
                : ExpansionTileCard(
                    key: UniqueKey(),
                    leading: CircleAvatar(child: Text(widget.name)),
                    title: const Text('See more'),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      const Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        // the number of items in the list
                        itemCount: widget.titles.length - 2,

                        // display each item of the product list
                        itemBuilder: (context, index) {
                          return Card(
                            // In many cases, the key isn't mandatory
                            key: UniqueKey(),
                            child: SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.titles[index + 2],
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    getwidget(index + 2),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
