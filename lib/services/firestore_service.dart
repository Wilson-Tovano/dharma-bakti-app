import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createMhs(String name, String email, String password) async {
    try {
      await _db.collection("akunMahasiswa").doc().set({
        "name": name,
        "email": email,
        "password": password,
      });
      print("Berhasil menambahkan akun baru ke Firestore");
    } catch (e) {
      print("Eror: $e");
    }
  }

  Future<String?> getNamaByEmailAndPassword(
      String email, String password) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection("akunMahasiswa")
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        if (data != null && data is Map<String, dynamic>) {
          return data["name"] as String?;
        }
      }
      print("No matching document found.");
      return null;
    } catch (e) {
      print("Error during fetch operation: $e");
      return null;
    }
  }
}
