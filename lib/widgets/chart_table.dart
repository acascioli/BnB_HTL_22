import 'package:flutter/material.dart';

class ChartTable extends StatefulWidget {
  const ChartTable({Key? key}) : super(key: key);

  @override
  State<ChartTable> createState() => _ChartTableState();
}

class _ChartTableState extends State<ChartTable> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(),
          children: [
            const TableRow(
              children: [
                Text(
                  'Select',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Alias Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Min Scale',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Min',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Actual',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Max',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Max Scale',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Average',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'M.U.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TableRow(
              children: [
                Checkbox(
                  value: value,
                  onChanged: (newValue) {
                    setState(
                      () {
                        value = newValue!;
                      },
                    );
                  },
                ),
                Text('Soccer', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
                Text('11', textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
