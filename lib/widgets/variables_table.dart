import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../utils/app_controller.dart';

class VariblesTable extends StatefulWidget {
  const VariblesTable({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  final String selectedCategory;

  @override
  State<VariblesTable> createState() => _VariblesTableState();
}

class _VariblesTableState extends State<VariblesTable> {
  bool value = false;

  _openColorPicker(index) async {
    Color _tempShadeColor = controller.varsTable['Color'][index];
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: const Text("Color picker"),
          actions: [
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  controller.varsTable['Color'][index] = _tempShadeColor;
                });
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: Navigator.of(context).pop,
            ),
          ],
          content: MaterialColorPicker(
            allowShades: true,
            selectedColor: _tempShadeColor,
            onColorChange: (color) => setState(() => _tempShadeColor = color),
            onMainColorChange: (color) =>
                setState(() => _tempShadeColor = color!),
          ),
        );
      },
    );
  }

  List<String> headers = [
    'n',
    'Selected',
    'Color',
    'Group',
    // 'Alias',
    'Name',
    'Description',
    // 'Type',
    // 'Write',
    'min',
    'Max',
    'Value',
    'Average',
    'M.U.',
  ];

  List<String> headersKeys = [
    'Selected',
    'Color',
    'Group',
    // 'ALIAS',
    'VISUALIZATION NAME',
    'DESCRIPTION',
    // 'INPUT TYPE',
    // 'INPUT PROTECTION',
    'MIN',
    'MAX',
    'Values',
    'Average',
    'U.M.',
  ];

  final controller = Get.put(AppController());
  late Map<String, dynamic> varsTable = controller.varsTable;
  late String searchText = controller.searchText;
  TextEditingController textController = TextEditingController();

  List<Widget> getHeaders() {
    List<Widget> headersWidget = [];
    for (var h in headers) {
      headersWidget.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            h,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return headersWidget;
  }

  List<TableRow> createTable() {
    Iterable<dynamic> indexes = [];
    Iterable<dynamic> searchIndexes = [];
    Map filteredMap = Map.from(controller.varsTable['Group'])
      // ..removeWhere((k, v) => v != widget.selectedCategory);
      ..removeWhere((k, v) =>
          !v.toLowerCase().contains(widget.selectedCategory.toLowerCase()));
    if (controller.searchText.isNotEmpty) {
      Map searchedMap = Map.from(controller.varsTable['VISUALIZATION NAME'])
        ..removeWhere((k, v) =>
            !v.toLowerCase().contains(controller.searchText.toLowerCase()));
      if (searchedMap.isEmpty) {
        searchIndexes = controller.varsTable['Group'].keys;
      } else {
        searchIndexes = searchedMap.keys;
      }
    }
    if (filteredMap.isEmpty) {
      indexes = controller.varsTable['Group'].keys;
      if (searchIndexes.isNotEmpty) {
        Set s1 = Set.from(indexes);
        Set s2 = Set.from(searchIndexes);
        indexes = s1.intersection(s2).toList();
      }
    } else {
      indexes = filteredMap.keys;
      if (searchIndexes.isNotEmpty) {
        Set s1 = Set.from(indexes);
        Set s2 = Set.from(searchIndexes);
        indexes = s1.intersection(s2).toList();
      }
    }
    List<TableRow> rows = [];
    for (var i in indexes) {
      // for (int i = 0; i < varsTable[headersKeys[0]].length; ++i) {
      rows.add(TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            i.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Checkbox(
            value: controller.varsTable['Selected'][i.toString()],
            onChanged: (newValue) {
              setState(
                () {
                  controller.varsTable[headersKeys[0]][i.toString()] = newValue;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            shape: const CircleBorder(),
            elevation: 4.0,
            child: InkWell(
              onTap: () => _openColorPicker(i.toString()),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: controller.varsTable[headersKeys[1]]
                    [i.toString()],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[2]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[3]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[4]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[5]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[6]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[7]][i.toString()].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[8]][i.toString()] ?? '0',
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[9]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ]));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerOne = ScrollController();
    final ScrollController controllerTwo = ScrollController();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        controller: controllerOne,
        primary: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        // color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: const Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none),
                      onChanged: (value) {
                        controller.searchInTable(textController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Scrollbar(
                controller: controllerTwo,
                child: SingleChildScrollView(
                  controller: controllerTwo,
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<AppController>(
                        builder: (_) => controller.varsTable.isEmpty
                            ? Table(
                                defaultColumnWidth:
                                    const IntrinsicColumnWidth(),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: getHeaders()),
                                ],
                              )
                            : GetBuilder<AppController>(
                                builder: (_) => Table(
                                  defaultColumnWidth:
                                      const IntrinsicColumnWidth(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(children: getHeaders()),
                                    ...createTable(),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
