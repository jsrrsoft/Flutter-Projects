import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    final userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCred.user;
  }

  Future<User?> signUp(String email, String password) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCred.user;
  }

  void signOut() {
    _auth.signOut();
  }

  User? getCurrentUser() => _auth.currentUser;
}
