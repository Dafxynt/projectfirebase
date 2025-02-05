import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/absen_controller.dart';
import '../widgets/shift_selection_widget.dart';
import '../widgets/history_widget.dart';

class AbsenScreen extends StatelessWidget {
  const AbsenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AbsenController absenController = Get.find();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ShiftSelectionWidget(
              shiftName: 'Shift Pagi',
              jamMasuk: '09.00',
              jamKeluar: '18.00',
              onMasukPressed: () {
                absenController.addAbsen(
                  type: 'Masuk',
                  shiftName: 'Shift Pagi',
                  jamMasuk: '09.00',
                );
              },
              onKeluarPressed: () {
                absenController.addAbsen(
                  type: 'Pulang',
                  shiftName: 'Shift Pagi',
                  jamMasuk: '18.00',
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                // Pastikan bahwa `absensiHistory` adalah variabel yang dapat diobservasi
                if (absenController.absensiHistory.isEmpty) {
                  return const Center(child: Text('No history available'));
                }
                return HistoryWidget(
                  historyData: absenController.absensiHistory,
                  onDelete: (id) => absenController.deleteAbsen(id),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
