import 'package:flutter/material.dart';

class ShiftSelectionWidget extends StatelessWidget {
  final String shiftName;
  final String jamMasuk;
  final String jamKeluar;
  final VoidCallback onMasukPressed;
  final VoidCallback onKeluarPressed;

  const ShiftSelectionWidget({
    Key? key,
    required this.shiftName,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.onMasukPressed,
    required this.onKeluarPressed,
  }) : super(key: key);

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
              ElevatedButton(
                onPressed: onMasukPressed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Masuk"),
              ),
              ElevatedButton(
                onPressed: onKeluarPressed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Keluar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
