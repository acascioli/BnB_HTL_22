import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../utils/app_controller.dart';

class SynopticCard extends StatefulWidget {
  const SynopticCard({
    Key? key,
    required this.name,
    required this.values,
    required this.titles,
    required this.widgetTypes,
  }) : super(key: key);

  final String name;
  final List<String> values;
  final List<String> titles;
  final List<int> widgetTypes;

  @override
  State<SynopticCard> createState() => _SynopticCardState();
}

class _SynopticCardState extends State<SynopticCard> {
  final Map switchesMap = {};
  late List<bool> switches = List.filled(widget.titles.length, false);
  final controller = Get.put(AppController());
  late Map<String, dynamic> varsMap = controller.varsMap;
  late Map<String, dynamic> varsTable = controller.varsTable;
  bool _valueError = false;

  // widgetTypes 0 for switch, 1 for text, 2 for textfield, 3 progressive bar
  Widget getwidget(int index) {
    switch (widget.widgetTypes[index]) {
      case 0:
        double scaleFactor = 0.8;
        return Transform.scale(
          scale: scaleFactor,
          child: GetBuilder<AppController>(
            builder: (_) => CupertinoSwitch(
              value: controller.varsMap.isEmpty
                  ? switches[index]
                  : (controller.varsMap[widget.values[index]] == 1)
                      ? true
                      : false,
              onChanged: (value) {
                setState(() {
                  switches[index] = value;
                });
              },
            ),
          ),
        );
      case 1:
        return widget.values.isEmpty
            ? const CircularProgressIndicator(
                strokeWidth: 2,
              )
            : Center(
                child: GetBuilder<AppController>(
                  builder: (_) => Text(
                    controller.varsMap.isEmpty
                        ? '-'
                        : controller.varsMap[widget.values[index]].toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              );
      case 2:
        switchesMap['TextField' + widget.titles[index]] = '0';
        return SizedBox(
          height: 25,
          width: 50,
          child: GetBuilder<AppController>(
            builder: (_) => TextField(
              onChanged: (value) {
                int idx = controller.varsTable['Nodes'].values
                    .toList()
                    .indexOf(widget.values[index]);
                // print(controller.varsTable['MAX'][idx]);
                if (value.isNotEmpty &&
                    controller.varsTable['MIN'][idx.toString()] != 'null' &&
                    controller.varsTable['MIN'][idx.toString()].runtimeType !=
                        Null &&
                    controller.varsTable['MIN'][idx.toString()] != 'Null') {
                  if (double.parse(value) <
                          controller.varsTable['MIN'][idx.toString()] ||
                      double.parse(value) >
                          double.parse(
                              controller.varsTable['MAX'][idx.toString()])) {
                    _valueError = true;
                  } else {
                    _valueError = false;
                  }
                }
              },
              onSubmitted: (Value) {
                if (_valueError) {
                  EasyLoading.showError(
                      "Value outside limits for mode : ${widget.name}");
                } else {}
              },
              style: _valueError
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.red)
                  : Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                fillColor: Colors.red,
                // filled: _valueError,
                // errorText: _errorText,
                // border: const OutlineInputBorder(),
                // labelText: switchesMap['TextField' + widget.titles[index]],
                hintText: controller.varsMap.isEmpty
                    ? '0'
                    : controller.varsMap[widget.values[index]].toString(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: _valueError
                          ? Colors.red
                          : Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        );
      case 3:
        // if (widget.values.isEmpty || widget.values[index] == null) {
        //   switchesMap['Bar' + widget.titles[index]] = 0.0;
        // } else {
        //   switchesMap['Bar' + widget.titles[index]] = widget.values[index];
        // }
        // ;
        return SizedBox(
          height: 30,
          width: 90,
          child: widget.values.isEmpty
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                )
              : GetBuilder<AppController>(
                  builder: (_) => FAProgressBar(
                    currentValue: (controller.varsMap.isEmpty ||
                            controller.varsMap[widget.values[index]] == null)
                        ? 0.0
                        : (controller.varsMap[widget.values[index]]
                                    .runtimeType ==
                                int)
                            ? controller.varsMap[widget.values[index]]
                                .toDouble()
                            : double.parse(
                                controller.varsMap[widget.values[index]]),
                    changeColorValue: 71,
                    changeProgressColor: Colors.red,
                    progressColor: Colors.blue,
                    displayText: '%',
                  ),
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
          itemCount: 4,
          // itemCount: widget.titles.length,

          // display each item of the product list
          itemBuilder: (context, index) {
            return index != 3
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
                        itemCount: widget.titles.length - 3,

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
                                      widget.titles[index + 3],
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    getwidget(index + 3),
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
