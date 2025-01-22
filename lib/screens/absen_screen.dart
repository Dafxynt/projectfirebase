import 'package:flutter/material.dart';
import '../auth/db_helper.dart';
import '../widgets/attendance_history.dart';
import '../widgets/shift_details_card.dart';

class AbsenScreen extends StatefulWidget {
  @override
  _AbsenScreenState createState() => _AbsenScreenState();
}

class _AbsenScreenState extends State<AbsenScreen> {
  List<Map<String, dynamic>> _attendanceHistory = [];

  Future<void> _loadHistory() async {
    _attendanceHistory = await DBHelper().getAttendanceHistory();
    print('Loaded history: $_attendanceHistory');  // Log data yang dimuat
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absen App'),
      ),
      body: Column(
        children: [
          ShiftDetailsCard(onHistoryUpdate: _loadHistory),
          AttendanceHistory(attendanceHistory: _attendanceHistory),
        ],
      ),
    );
  }
}
