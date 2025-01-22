import 'package:flutter/material.dart';
import '../auth/db_helper.dart';

class ShiftDetailsCard extends StatelessWidget {
  final Function() onHistoryUpdate; // Callback untuk memperbarui riwayat absen

  ShiftDetailsCard({required this.onHistoryUpdate});

  void _handleClockIn() async {
    await DBHelper().insertAttendance('Masuk');
    onHistoryUpdate(); // Memperbarui riwayat setelah penyimpanan
  }

  void _handleClockOut() async {
    await DBHelper().insertAttendance('Keluar');
    onHistoryUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _handleClockIn,
            child: Text('Masuk'),
          ),
          ElevatedButton(
            onPressed: _handleClockOut,
            child: Text('Keluar'),
          ),
        ],
      ),
    );
  }
}
