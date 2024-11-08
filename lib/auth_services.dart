import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Sukses mendaftar';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Password terlalu lemah.';
      } else if (e.code == 'email-already-in-use') {
        return 'Sudah ada akun terhadap email tersebut.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Tidak ditemukan pengguna untuk email tersebut.';
      } else if (e.code == 'wrong-password') {
        return 'Kata sandi salah untuk pengguna itu.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}