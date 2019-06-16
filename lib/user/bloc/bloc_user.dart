import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //data flow - stream
  //stream firebase already implemented in firebase api
  //if not a streamcontroller would be required
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();

  signOut() {
    _auth_repository.signOut();
  }


  final _cloud_firestore_repository = CloudFirestoreRepository();

  updateUserData(User user) => _cloud_firestore_repository.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
