import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_controller.dart';

class VariblesTable extends StatefulWidget {
  const VariblesTable({Key? key}) : super(key: key);

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

  List<Widget> getHeaders() {
    List<Widget> headersWidget = [];
    for (var h in headers) {
      headersWidget.add(
        Text(
          h,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }
    return headersWidget;
  }

  List<TableRow> createTable(varsTable) {
    List<TableRow> rows = [];
    for (int i = 0; i < varsTable[headersKeys[0]].length; ++i) {
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
            varsTable[headersKeys[0]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[1]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[2]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[3]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[4]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[5]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[6]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[7]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[8]][i.toString()].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            varsTable[headersKeys[9]][i.toString()].toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ]));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<AppController>(
          builder: (_) => controller.varsTable.isEmpty
              ? Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: getHeaders()),
                  ],
                )
              : Table(
                  // defaultColumnWidth: IntrinsicColumnWidth(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: getHeaders()),
                    ...createTable(controller.varsTable),
                  ],
                ),
        ),
      ),
    );
  }
}
