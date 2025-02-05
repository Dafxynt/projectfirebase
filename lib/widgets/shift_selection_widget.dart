import 'package:flutter/material.dart';
import 'custom_button.dart';

class ShiftSelectionWidget extends StatelessWidget {
  final String shiftName;
  final String jamMasuk;
  final String jamKeluar;
  final VoidCallback onMasukPressed;
  final VoidCallback onKeluarPressed;

  const ShiftSelectionWidget({
    super.key,
    required this.shiftName,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.onMasukPressed,
    required this.onKeluarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(shiftName, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Jam Masuk: $jamMasuk"),
          Text("Jam Keluar: $jamKeluar"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "Masuk",
                onPressed: onMasukPressed,
                backgroundColor: Colors.green,
                width: 100,
                height: 40,
              ),
              CustomButton(
                text: "Keluar",
                onPressed: onKeluarPressed,
                backgroundColor: Colors.red,
                width: 100,
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
