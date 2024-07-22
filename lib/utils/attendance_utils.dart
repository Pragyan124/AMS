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
          print("Row data types: ${row[0]?.runtimeType}, ${row[1]?.runtimeType}"); // Debug data types

          DateTime date;
          if (row[0] is String) {
            date = DateTime.tryParse(row[0] as String) ?? DateTime.now();
          } else if (row[0] is DateTime) {
            date = row[0] as DateTime;
          } else if (row[0] is int) {
            date = DateTime.fromMillisecondsSinceEpoch(row[0] as int);
          } else {
            date = DateTime.tryParse(row[0].toString()) ?? DateTime.now();
          }

          String status = row[1]?.toString() ?? 'Unknown';
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
