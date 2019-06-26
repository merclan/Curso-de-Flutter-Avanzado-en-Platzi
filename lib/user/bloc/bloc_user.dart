import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //data flow - stream
  //stream firebase already implemented in firebase api
  //if not a streamcontroller would be required
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();

  signOut() {
    _auth_repository.signOut();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<StorageUploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  Stream<QuerySnapshot> placeListStream =
      Firestore.instance.collection(CloudFirestoreApi.PLACES).snapshots();

  Stream<QuerySnapshot> get placeStream => placeListStream;

  Stream<QuerySnapshot> myPlacesListStream(String uid) => Firestore.instance
      .collection(CloudFirestoreApi.PLACES)
      .where("userOwner",
          isEqualTo:
              Firestore.instance.document("${CloudFirestoreApi.USERS}/$uid"))
      .snapshots();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placeListSnapshots) =>
      _cloudFirestoreRepository.buildMyPlaces(placeListSnapshots);

  Stream<QuerySnapshot> placesListStream() =>
      Firestore.instance.collection(CloudFirestoreApi.PLACES).snapshots();

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placeListSnapshots) =>
      _cloudFirestoreRepository.buildPlaces(placeListSnapshots);

  @override
  void dispose() {}
}
