import 'package:flutter/material.dart';

import 'colors.dart';
import 'padding.dart';
import 'text_style.dart';

class MyDataTable {
  static Expanded place({required DataTable dataTable}) => Expanded(
          child: SingleChildScrollView(
              child: Column(children: [
        Row(children: [Expanded(child: Padding(padding: MyPadding.primaryAndQrt.copyWith(top: 0), child: dataTable))])
      ])));

  static DataTable table({required List<String> header, required List<DataRow> rows}) => DataTable(
      headingTextStyle: MyTextStyle.black.copyWith(fontWeight: FontWeight.bold, color: MyColor.dataTableHeaderLabel),
      border: TableBorder.all(width: 1, color: MyColor.off),
      headingRowColor: MaterialStatePropertyAll(MyColor.dataTableHeaderBackground),
      dataTextStyle: TextStyle(color: MyColor.dataTableRowLabel),
      columns: List.generate(header.length, (index) => DataColumn(label: Expanded(child: Center(child: Text(header[index], textAlign: TextAlign.center))))),
      rows: rows);

  static DataCell cell({required String text}) => DataCell(Center(
      child: Text(text.length > 120 ? '${text.substring(0, 120)}...' : text,
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1.25,
              color: text == "IN PROGRESS"
                  ? MyColor.info
                  : text == "SUCCESS"
                      ? MyColor.success
                      : text == "PENDING"
                          ? MyColor.warning
                          : text == "FAILED" || text == "NOT FOUND"
                              ? MyColor.danger
                              : null))));

  static DataRow row({required int index, required List<String> values, void Function()? action, IconData? actionIcon, String? iconToolTip}) => DataRow(
      color: MaterialStatePropertyAll(index.isEven ? MyColor.dataTableRowBackgroundB : MyColor.dataTableRowBackgroundA),
      cells: action == null
          ? List.generate(values.length, (index) => cell(text: values[index]))
          : (List.generate(values.length, (index) => cell(text: values[index]))
            ..add(DataCell(onTap: action, Center(child: IconButton(tooltip: iconToolTip ?? "View Details", onPressed: action, icon: Icon(actionIcon ?? Icons.open_in_new, color: MyColor.primary, size: 20)))))));
}
