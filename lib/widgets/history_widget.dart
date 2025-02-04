import 'package:flutter/material.dart';
import '../controllers/absen_controller.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final absenController = AbsenController();

    return StreamBuilder<List<Map<String, dynamic>>>(  // Mendengarkan perubahan data
      stream: absenController.getAbsensiHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Tidak ada riwayat absen."));
        }

        // Log data yang diterima oleh stream
        debugPrint("📡 Data riwayat: ${snapshot.data}");

        final historyData = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Riwayat Absen",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: historyData.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6D0AB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        item['type'] == 'Masuk' ? Icons.login : Icons.logout,
                        color: item['type'] == 'Masuk' ? Colors.green : Colors.red,
                      ),
                      title: Text(
                        "Absen ${item['type']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${item['shift_name']} - Jam ${item['jam_masuk']}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          absenController.deleteAbsen(item['id']);
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
