import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  List<String> headers = [
    'n',
    'Group',
    'Alias',
    'Name',
    'Description',
    'Type',
    'Write',
    'min',
    'Max',
    'Value',
    'M.U.',
  ];

  List<String> headersKeys = [
    'Group',
    'ALIAS',
    'VISUALIZATION NAME',
    'DESCRIPTION',
    'INPUT TYPE',
    'INPUT PROTECTION',
    'MIN',
    'MAX',
    'Values',
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
    Map filteredMap = Map.from(controller.varsTable[headersKeys[0]])
      // ..removeWhere((k, v) => v != widget.selectedCategory);
      ..removeWhere((k, v) =>
          !v.toLowerCase().contains(widget.selectedCategory.toLowerCase()));
    if (controller.searchText.isNotEmpty) {
      Map searchedMap = Map.from(controller.varsTable[headersKeys[1]])
        ..removeWhere((k, v) =>
            !v.toLowerCase().contains(controller.searchText.toLowerCase()));
      if (searchedMap.isEmpty) {
        searchIndexes = controller.varsTable[headersKeys[0]].keys;
      } else {
        searchIndexes = searchedMap.keys;
      }
    }
    if (filteredMap.isEmpty) {
      indexes = controller.varsTable[headersKeys[0]].keys;
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
          child: Text(
            controller.varsTable[headersKeys[0]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[1]][i.toString()].toString(),
            textAlign: TextAlign.center,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.varsTable[headersKeys[8]][i.toString()].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
