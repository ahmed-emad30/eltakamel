import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'empty_table_widget.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.headers, required this.data});

  final List<String> headers;
  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    final hasElements = data.isNotEmpty;

    return Column(
      children: [
        Container(
          margin: REdgeInsets.only(bottom: hasElements ? 16 : 0),

          padding: REdgeInsetsDirectional.only(
            top: 16,
            start: 16,
            end: 16,
            bottom: hasElements ? 32 : 8,
          ),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),

              columns: List.generate(
                headers.length,
                (index) => DataColumn(label: Text(headers[index])),
              ),
              rows:
                  hasElements
                      ? List.generate(data.length, (rowIndex) {
                        final rowItem = data[rowIndex];
                        return DataRow(
                          cells: List.generate(
                            rowItem.length,
                            (cellIndex) => DataCell(Text(rowItem[cellIndex])),
                          ),
                        );
                      })
                      : [],
            ),
          ),
        ),
        if (!hasElements) EmptyTableWidget(),
      ],
    );
  }
}
