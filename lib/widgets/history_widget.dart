import 'package:flutter/material.dart';
import 'reuse_card.dart';

class HistoryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> historyData;
  final Function(String) onDelete;

  const HistoryWidget({Key? key, required this.historyData, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyData.length,
      itemBuilder: (context, index) {
        final absen = historyData[index];
        return AbsenCard(
          shiftName: absen['shiftName'] ?? 'Unknown Shift',
          jamMasuk: absen['jamMasuk'] ?? 'Unknown Time',
          onDelete: () => onDelete(absen['id']),
        );
      },
    );
  }
}

