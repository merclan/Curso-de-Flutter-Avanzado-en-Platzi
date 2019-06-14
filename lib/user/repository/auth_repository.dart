import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/user/repository/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthApi();

  Future<FirebaseUser> signInFirebase () => _firebaseAuthApi.signIn();
  signOut() => _firebaseAuthApi.signOut();
}