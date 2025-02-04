import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AbsenController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAbsen({
    required String type, // "Masuk" atau "Pulang"
    required String shiftName,
    required String jamMasuk,
  }) async {
    try {
      await _firestore.collection('absensi').add({
        'type': type,
        'shift_name': shiftName,
        'jam_masuk': jamMasuk,
        'time': DateTime.now().toIso8601String(),
      });

      debugPrint("✅ Absen $type berhasil ditambahkan ke Firestore.");
    } catch (e) {
      debugPrint("❌ Error saat menambahkan absen: $e");
    }
  }

  Stream<List<Map<String, dynamic>>> getAbsensiHistory() {
    return _firestore.collection('absensi').orderBy('time', descending: true).snapshots().map((snapshot) {
      final data = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'type': doc['type'],
          'shift_name': doc['shift_name'],
          'jam_masuk': doc['jam_masuk'],
        };
      }).toList();

      debugPrint("📢 Data Riwayat: $data"); // Log hasil query
      return data;
    });
  }

  Future<void> deleteAbsen(String docId) async {
    try {
      await _firestore.collection('absensi').doc(docId).delete();
      debugPrint("🗑 Data absen berhasil dihapus.");
    } catch (e) {
      debugPrint("❌ Error saat menghapus data absen: $e");
    }
  }
}
