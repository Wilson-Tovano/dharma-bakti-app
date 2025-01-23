import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dharma_bakti_app/globals/user_info.dart';
import 'package:intl/intl.dart';

class FirestoreDbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAttendance(
      String name, String email) async {
    try {
      var querySnapshot = await _db
          .collection("studentAttendance")
          .where("name", isEqualTo: name)
          .where("email", isEqualTo: email)
          // .orderBy("dateForSorting")
          .get();

      //querySnapshot.docs adalah List semua document yang ada di Firestore
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
      print("Berhasil mendapatkan studentAttendance");

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Error completing: $e");
      return []; // Return an empty list if there's an error
    }
  }

  Future<void> postAttendance(
      String name, String email, String waktuHadir, String waktuPulang) async {
    try {
      if (waktuHadir != "" && waktuPulang != "") {
        await _db.collection("studentAttendance").doc().set(
          {
            "name": name,
            "email": email,
            "signInTime": waktuHadir,
            "signOutTime": waktuPulang,
            "date": DateFormat('d MMMM yyyy').format(DateTime.now()),
            "dateForSorting": Timestamp.fromDate(DateTime.now()),
          },
        );
      } else {
        print("Absensi masuk dan pulang belum lengkap!");
      }
    } catch (e) {
      print("Tidak bisa mengupload data absensi!: $e");
    }
  }

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
          studentNameFromFirestore = data["name"];
          studentEmailFromFirestore = data["email"];

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
