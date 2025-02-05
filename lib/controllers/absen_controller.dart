import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AbsenController extends GetxController {
  var absensiHistory = <Map<String, dynamic>>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchAbsensiHistory();
  }

  // Ambil data absensi dari Firestore
  void fetchAbsensiHistory() async {
    var snapshot = await _firestore.collection('absensi').orderBy('timestamp', descending: true).get();
    absensiHistory.assignAll(snapshot.docs.map((doc) {
      var data = doc.data();
      return {
        'id': doc.id,
        'type': data['type'],
        'shiftName': data['shiftName'],
        'jamMasuk': data['jamMasuk'],
      };
    }).toList());
  }

  // Tambahkan data absensi ke Firestore
  void addAbsen({required String type, required String shiftName, required String jamMasuk}) async {
    var timestamp = FieldValue.serverTimestamp();

    var docRef = await _firestore.collection('absensi').add({
      'type': type,
      'shiftName': shiftName,
      'jamMasuk': jamMasuk,
      'timestamp': timestamp,
    });

    absensiHistory.insert(0, {
      'id': docRef.id,
      'type': type,
      'shiftName': shiftName,
      'jamMasuk': jamMasuk,
    });
  }

  // Hapus absensi dari Firestore
  void deleteAbsen(String id) async {
    await _firestore.collection('absensi').doc(id).delete();
    absensiHistory.removeWhere((item) => item['id'] == id);
  }
}
