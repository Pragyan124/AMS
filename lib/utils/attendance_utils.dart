import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Map<DateTime, String>> loadAttendanceData() async {
  final ByteData data = await rootBundle.load('assets/attendance.xlsx');
  final List<int> bytes = data.buffer.asUint8List();
  final Excel excel = Excel.decodeBytes(bytes);

  Map<DateTime, String> attendanceRecords = {};

  for (var table in excel.tables.keys) {
    print("Table: $table"); // Print table name
    var rows = excel.tables[table]?.rows;
    if (rows != null) {
      for (var row in rows.skip(1)) { // Skip header row
        try {
          DateTime date = DateTime.parse(row[0] as String);
          String status = row[1] as String;
          attendanceRecords[date] = status;
          print("Loaded: $date -> $status"); // Print loaded data
        } catch (e) {
          print("Error parsing row: $row, error: $e");
        }
      }
    }
  }
  return attendanceRecords;
}
