import 'package:flutter/material.dart';
import '../auth/db_helper.dart';

class AttendanceHistory extends StatelessWidget {
  final List<Map<String, dynamic>> attendanceHistory;

  AttendanceHistory({required this.attendanceHistory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Riwayat Absen',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        // Menampilkan riwayat absen dalam ListView
        Expanded(
          child: ListView.builder(
            itemCount: attendanceHistory.length,
            itemBuilder: (context, index) {
              final entry = attendanceHistory[index];
              return ListTile(
                title: Text(entry['action']),
                subtitle: Text(entry['time']),
              );
            },
          ),
        ),
      ],
    );
  }
}
