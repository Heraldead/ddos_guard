import 'package:firebase_auth/firebase_auth.dart';

import '../domain/user.dart';

class Auth {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return AuthUser.fromFirebase(user);
    } catch (e) {}
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return AuthUser.fromFirebase(user);
    } catch (e) {}
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? AuthUser.fromFirebase(user) : null);
  }
}
