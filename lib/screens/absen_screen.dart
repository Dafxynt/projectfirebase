import 'package:flutter/material.dart';
import '../controllers/absen_controller.dart';
import '../widgets/shift_selection_widget.dart';
import '../widgets/history_widget.dart';

class AbsenScreen extends StatelessWidget {
  const AbsenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final absenController = AbsenController(); // Inisialisasi controller

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              ShiftSelectionWidget(
                shiftName: 'Shift Pagi',
                jamMasuk: '09.00',
                jamKeluar: '12.00',
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
                    jamMasuk: '12.00',
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const HistoryWidget(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
